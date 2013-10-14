﻿/*
 *  Copyright 2008-2010 biaoping.yin
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
package org.frameworkset.soa;

import java.beans.IntrospectionException;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.io.Writer;
import java.lang.reflect.Array;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.frameworkset.spi.SOAApplicationContext;
import org.frameworkset.util.ClassUtil;
import org.frameworkset.util.ClassUtil.ClassInfo;
import org.frameworkset.util.ClassUtil.PropertieDescription;

import com.frameworkset.spi.assemble.BeanInstanceException;
import com.frameworkset.spi.assemble.CurrentlyInCreationException;
import com.frameworkset.util.NoSupportTypeCastException;
import com.frameworkset.util.ValueObjectUtil;

/**
 * <p>
 * Title: ObjectSerializable.java
 * </p>
 * <p>
 * Description: 解决对象方法调用转换为xml串的功能
 * </p>
 * <p>
 * bboss workgroup
 * </p>
 * <p>
 * Copyright (c) 2008
 * </p>
 * 
 * @Date 2011-5-10 上午11:14:21
 * @author biaoping.yin
 * @version 1.0
 */
public class ObjectSerializable {
	public static final String content_header_gbk = "<?xml version=\"1.0\" encoding=\"gbk\"?>";
	public static final String content_header_utf_8 = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
	public static final String call_header = "<esb><call>";
	public static final String call_tailer = "</call></esb>";

	public static final String CHARSET_UTF_8 = "UTF-8";
	public static final String CHARSET_GBK = "GBK";

	public static final String[] throwable_filterattributes = new String[] {
			"message", "cause" };

	/**
	 * 标识null值类型
	 */
	public static final String NULL_TYPE = "s:nvl";

	/**
	 * @deprecated use method toObject(xml,Class)
	 * @return
	 */
	public static <T> T convertXMLToBeanObject(String name, String beanxml,
			Class<T> beantype) {
		SOAApplicationContext context = new SOAApplicationContext(beanxml);
		T object = context.getTBeanObject(name, beantype);
		context.destroy();
		return object;

	}

	private static void convertMethodCallToXMLMethod(StringWriter ret,
			String methodName, Object[] params, Class[] paramTypes,
			String charset) throws NoSupportTypeCastException,
			NumberFormatException, IllegalArgumentException,
			IntrospectionException, IOException {
		SerialStack stack = new SerialStack();
		ret
				.append("<p n=\"soamethodcall\" ")
				.append("cs=\"org.frameworkset.soa.SOAMethodCall\" >")
				.append(
						"<p n=\"soamethodinfo\" cs=\"org.frameworkset.soa.SOAMethodInfo\" ")
				.append("f:methodName=\"").append(methodName).append("\">");
		if (paramTypes == null || paramTypes.length == 0) {
			ret.append("<p n=\"params\" s:nvl=\"true\" s:t=\"").append(
					ValueObjectUtil.getSimpleTypeName(Object[].class)).append(
					"\"/>");
		} else {

			ret.append("<p n=\"params\">").append("<a cmt=\"").append(
					ValueObjectUtil.getComponentTypeName(Object[].class))
					.append("\">");

			{
				
				stack.addStack(params, "params");
				ObjectSerializable.convertParams(ret, params, paramTypes, null,stack,"params");
				
			}
			ret.append("</a></p>");
		}
		stack.clear();
		ret.append("</p></p>");

		// SOAMethodCall method = new SOAMethodCall();
		// return convertSOAMethodCallToXMLMethod(method);
	}

	public static String convertMethodCallToXMLMethod(Method method,
			Object[] params, Class[] paramTypes, String charset)
			throws NoSupportTypeCastException, NumberFormatException,
			IllegalArgumentException, IntrospectionException {
		try {
			StringWriter ret = new StringWriter();

			if (charset.equals(CHARSET_UTF_8)) {
				ret.append(content_header_utf_8);
			} else
				ret.append(content_header_gbk);
			ret.append(call_header);
			convertMethodCallToXMLMethod(ret, method.getName(), params, paramTypes,
					charset);
			ret.append(call_tailer);
			return ret.toString();
		} catch (Exception e) {
			throw new IllegalArgumentException(e);
		}

	}

	public static String convertSOAMethodCallToXMLMethod(SOAMethodCall method,
			String charset) throws NoSupportTypeCastException,
			NumberFormatException, IllegalArgumentException,
			IntrospectionException {
		try {
			StringWriter ret = new StringWriter();
			if (charset.equals(CHARSET_UTF_8)) {
				ret.append(content_header_utf_8);
			} else
				ret.append(content_header_gbk);
			ret.append(call_header);
			SerialStack stack = new SerialStack();
			convertBeanObjectToXML("soamethodcall", method, method.getClass(),
					null, ret,stack,"soamethodcall");
			stack.clear();
			ret.append(call_tailer);
			return ret.toString();
		} catch (Exception e) {
			throw new IllegalArgumentException(e);
		}
	}

	public final static String convertBeanObjectToXML(Object obj, Class type,
			String dateformat) throws NoSupportTypeCastException,
			NumberFormatException, IllegalArgumentException,
			IntrospectionException {
		try {
			StringWriter ret = new StringWriter();
			SerialStack stack = new SerialStack();
			String name = UUID.randomUUID().toString();
			convertBeanObjectToXML(name, obj, type, dateformat, ret,stack,name);
			stack.clear();
			return ret.toString();
		} catch (Exception e) {
			throw new IllegalArgumentException(e);
		}
	}

	/**
	 * @deprecated use Method toXML( Object obj).
	 */
	public final static String convertBeanObjectToXML(String name, Object obj,
			Class type) throws NumberFormatException, IllegalArgumentException,
			IntrospectionException {
		return convertBeanObjectToXML(name, obj, type, (String) null,
				CHARSET_GBK);
	}

	public final static String toXML(Object obj) throws NumberFormatException,
			IllegalArgumentException, IntrospectionException {
		if (obj == null)
			return null;
		return convertBeanObjectToXML("_dflt_", obj, obj.getClass(),
				(String) null, CHARSET_GBK);
	}

	public final static void toXML(Object obj, Writer out)
			throws NumberFormatException, IllegalArgumentException,
			IntrospectionException {
		if (obj == null)
			return ;
		convertBeanObjectToXML("_dflt_", obj,
				obj.getClass(), null, CHARSET_GBK,out);
//		return convertBeanObjectToXML("_dflt_", obj, obj.getClass(),
//				(String) null, CHARSET_GBK);
		
	}

	public static <T> T toBean(String beanxml, Class<T> beantype) {
		if (beanxml == null || beanxml.equals(""))
			return null;
		SOAApplicationContext context = new SOAApplicationContext(beanxml);
		T object = context.getTBeanObject("_dflt_", beantype);
		context.destroy();
		return object;

	}

	public static <T> T toBean(InputStream instream, Class<T> beantype) {
		if (instream == null)
			return null;
		SOAApplicationContext context = new SOAApplicationContext(instream);
		T object = context.getTBeanObject("_dflt_", beantype);
		context.destroy();
		return object;

	}

//	public final static String convertBeanObjectToXML(String name, Object obj,
//			Class type, String dateformat, String charset)
//			throws NumberFormatException, IllegalArgumentException,
//			IntrospectionException {
//		StringBuffer ret = new StringBuffer();
//
//		if (charset.equals(CHARSET_UTF_8)) {
//			ret.append(content_header_utf_8);
//		} else
//			ret.append(content_header_gbk);
//		ret.append("<ps>");
//		convertBeanObjectToXML(name, obj, type, dateformat, ret);
//		ret.append("</ps>");
//		return ret.toString();
//	}
	
	
	public final static String convertBeanObjectToXML(String name, Object obj,
			Class type, String dateformat, String charset)
			throws NumberFormatException, IllegalArgumentException,
			IntrospectionException {
		StringWriter ret = new StringWriter();

//		if (charset.equals(CHARSET_UTF_8)) {
//			ret.append(content_header_utf_8);
//		} else
//			ret.append(content_header_gbk);
//		ret.append("<ps>");
//		convertBeanObjectToXML(name, obj, type, dateformat, ret);
//		ret.append("</ps>");
		convertBeanObjectToXML(name, obj,
				type, dateformat, charset,ret);
		return ret.toString();
	}
	
	
	public final static void convertBeanObjectToXML(String name, Object obj,
			Class type, String dateformat, String charset,Writer ret)
			throws NumberFormatException, IllegalArgumentException,
			IntrospectionException {
//		StringBuffer ret = new StringBuffer();

		try {
			if (charset.equals(CHARSET_UTF_8)) {
				ret.append(content_header_utf_8);
			} else
				ret.append(content_header_gbk);
			ret.append("<ps>");
			SerialStack stack = new SerialStack();
			convertBeanObjectToXML(name, obj, type, dateformat, ret,stack,name);
			stack.clear();
			ret.append("</ps>");
		} catch (Exception e) {
			throw new IllegalArgumentException(e);
		}
//		return ret.toString();
	}

	public final static String convertBeanObjectToXML(Object obj, Class type)
			throws NoSupportTypeCastException, NumberFormatException,
			IllegalArgumentException, IntrospectionException {
		StringWriter ret = new StringWriter();
		try {
			SerialStack stack = new SerialStack();
			String name = UUID.randomUUID().toString();
			convertBeanObjectToXML(name, obj, type, null, ret,stack,name);
			stack.clear();
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		return ret.toString();
	}

	public final static String convertBeanObjectsToXML(List<String> names,
			List<Object> objs, List<Class> types) throws NumberFormatException,
			IllegalArgumentException, IntrospectionException {

		
			return convertBeanObjectsToXML(names, objs, types, CHARSET_GBK);
		
	}

	public final static String convertBeanObjectsToXML(List<String> names,
			List<Object> objs, List<Class> types, String charset)
			throws NumberFormatException, IllegalArgumentException,
			IntrospectionException, NoSupportTypeCastException {

		try {
			StringWriter ret = new StringWriter();
			if (charset.equals(CHARSET_UTF_8)) {
				ret.append(content_header_utf_8);
			} else
				ret.append(content_header_gbk);
			ret.append("<ps>");
			if (objs != null && objs.size() > 0) {
				int i = 0;
				SerialStack stack = new SerialStack();
				for (Object obj : objs) {
					convertBeanObjectToXML(names.get(i), obj, types.get(i), null,
							ret,stack,names.get(i));
					i++;
				}
			}
			ret.append("</ps>");
			return ret.toString();
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
	}

	/**
	 * 根据对象值，对象类型查找到对应的方法，这个玩意儿，比较麻烦
	 * 需要判读currentAddress为空的情况，biaoping.yin
	 * @param obj
	 * @param type
	 * @param dateformat
	 * @param ret
	 * @throws NoSupportTypeCastException
	 * @throws NumberFormatException
	 * @throws IllegalArgumentException
	 * @throws IntrospectionException
	 * @throws IOException 
	 */
	private final static void convertBeanObjectToXML(String name, Object obj,
			Class type, String dateformat, Writer ret,SerialStack serialStack,String currentAddress)
			throws NoSupportTypeCastException, NumberFormatException,
			IllegalArgumentException, IntrospectionException, IOException {
		if (obj != null)
		{
			type = obj.getClass();
			ClassInfo classinfo = ClassUtil.getClassInfo(type);
			if(!classinfo.isBaseprimary())
			{
				String address = serialStack.getRefID(obj);
				if(address != null)
				{
					if (name == null)
					{
						ret
								.append("<p refid=\"attr:").append(address)
								.append("\"/>");
					}
					else
					{
						ret
								.append("<p n=\"")
								.append(name)
								.append("\" refid=\"attr:").append(address)
								.append("\"/>");
					}
					return;
				}
				else
				{
					serialStack.addStack(obj, currentAddress);
				}
			}
			
		}
		
		if (type == byte[].class) {
			if (obj == null) {
				if (name == null)
					ret.append("<p s:nvl=\"true\" s:t=\"").append(
							ValueObjectUtil.getSimpleTypeName(type)).append(
							"\"/>");
				else
					ret.append("<p n=\"").append(name).append(
							"\" s:nvl=\"true\" s:t=\"").append(
							ValueObjectUtil.getSimpleTypeName(type)).append(
							"\"/>");

				return;
			} else {
				
				if (!File.class.isAssignableFrom(type)) {
					
					if (name == null)
					{
						ret
								.append("<p s:t=\"")
								.append(ValueObjectUtil.getSimpleTypeName(type))
								.append("\"><![CDATA[")
								.append(
										ValueObjectUtil
												.byteArrayEncoder((byte[]) obj))
								.append("]]></p>");
					}
					else
						ret
								.append("<p n=\"")
								.append(name)
								.append("\" s:t=\"")
								.append(ValueObjectUtil.getSimpleTypeName(type))
								.append("\"><![CDATA[")
								.append(
										ValueObjectUtil
												.byteArrayEncoder((byte[]) obj))
								.append("]]></p>");
				} else {

					File object = (File) obj;

					java.io.FileInputStream byteIn = null;
					java.io.ByteArrayOutputStream fileOut = null;
					try {
						byteIn = new java.io.FileInputStream(object);
						fileOut = new java.io.ByteArrayOutputStream();
						byte v[] = new byte[1024];

						int i = 0;

						while ((i = byteIn.read(v)) > 0) {
							fileOut.write(v, 0, i);

						}
						fileOut.flush();
						if (name == null)
							ret.append("<p s:t=\"").append(
									ValueObjectUtil.getSimpleTypeName(type))
									.append("\"><![CDATA[").append(
											ValueObjectUtil
													.byteArrayEncoder(fileOut
															.toByteArray()))
									.append("]]></p>");
						else
							ret.append("<p n=\"").append(name).append(
									"\" s:t=\"").append(
									ValueObjectUtil.getSimpleTypeName(type))
									.append("\"><![CDATA[").append(
											ValueObjectUtil
													.byteArrayEncoder(fileOut
															.toByteArray()))
									.append("]]></p>");
					} catch (FileNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} finally {
						try {
							if (byteIn != null)
								byteIn.close();
						} catch (Exception e) {

						}
						try {
							if (fileOut != null)
								fileOut.close();
						} catch (Exception e) {

						}
					}

				}
			}
			return;
		}

		else if (type != null && File.class.isAssignableFrom(type)) {
			if (obj == null) {
				if (name == null)
					ret.append("<p s:nvl=\"true\" s:t=\"File\"/>");
				else
					ret.append("<p n=\"").append(name).append(
							"\" s:nvl=\"true\" s:t=\"File\"/>");

				return;
			} else {
				File object = (File) obj;

				java.io.FileInputStream byteIn = null;
				java.io.ByteArrayOutputStream fileOut = null;
				try {
					byteIn = new java.io.FileInputStream(object);
					fileOut = new java.io.ByteArrayOutputStream();
					byte v[] = new byte[1024];

					int i = 0;

					while ((i = byteIn.read(v)) > 0) {
						fileOut.write(v, 0, i);

					}
					fileOut.flush();
					if (name == null)
						ret.append("<p s:t=\"File\"><![CDATA[").append(
								ValueObjectUtil.byteArrayEncoder(fileOut
										.toByteArray())).append("]]></p>");
					else
						ret.append("<p n=\"").append(name).append(
								"\" s:t=\"File\"><![CDATA[").append(
								ValueObjectUtil.byteArrayEncoder(fileOut
										.toByteArray())).append("]]></p>");
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					try {
						if (byteIn != null)
							byteIn.close();
					} catch (Exception e) {

					}
					try {
						if (fileOut != null)
							fileOut.close();
					} catch (Exception e) {

					}
				}

			}

			return;
		} else if (type == String.class) {
			if (obj == null) {
				if (name == null)
					ret.append("<p s:nvl=\"true\" s:t=\"String\"/>");
				else
					ret.append("<p n=\"").append(name).append(
							"\" s:nvl=\"true\" s:t=\"String\"/>");

			} else {
				if (name == null)
				{
					if(!obj.equals(""))
					{
						ret.append("<p s:t=\"String\"><![CDATA[").append(obj.toString())
								.append("]]></p>");
					}
					else
					{
						ret.append("<p s:t=\"String\" v=\"\"/>");
					}
				}
				else
				{
					if(!obj.equals(""))
					{
						ret.append("<p n=\"").append(name).append(
							"\" s:t=\"String\"><![CDATA[").append(obj.toString()).append(
							"]]></p>");
					}
					else
					{
						ret.append("<p n=\"").append(name).append(
								"\" s:t=\"String\" v=\"\"/>");
					}
				}
			}
			return;
		} else if (type != null && List.class.isAssignableFrom(type)) {
			if (obj == null) {
				if (name == null)
					ret.append("<p s:nvl=\"true\" s:t=\"").append(
							ValueObjectUtil.getSimpleTypeName(type)).append(
							"\"/>");
				else
					ret.append("<p n=\"").append(name).append(
							"\" s:nvl=\"true\" s:t=\"").append(
							ValueObjectUtil.getSimpleTypeName(type)).append(
							"\"/>");

			} else {
				List datas = (List) obj;

				if (name == null)
				{
					ret.append("<p s:t=\"").append(
							ValueObjectUtil.getSimpleTypeName(type)).append(
							"\">");
					
				}
				else
				{
					ret.append("<p n=\"").append(name).append("\" s:t=\"")
							.append(ValueObjectUtil.getSimpleTypeName(type))
							.append("\">");
//					currentAddress = currentAddress + "->" + name;
				}
				ret.append("<l cmt=\"bean\">");
				Object value = null;
				for (int i = 0; i < datas.size(); i++) {
					value = datas.get(i);
					if (value == null)
						/**
						 * convertBeanObjectToXML(String name, Object obj,
			Class type, String dateformat, Writer ret,SerialStack serialStack,String currentAddress)
						 */
						convertBeanObjectToXML(null, value, null, dateformat,
								ret,serialStack,currentAddress + "[" + i + "]");
					else
						convertBeanObjectToXML(null, value, value.getClass(),
								dateformat, ret,serialStack,currentAddress + "[" + i + "]");
				}
				ret.append("</l>");
				ret.append("</p>");
			}

		}

		else if (type != null && Set.class.isAssignableFrom(type)) {
			if (obj == null) {
				if (name == null)
					ret.append("<p s:nvl=\"true\" s:t=\"").append(
							ValueObjectUtil.getSimpleTypeName(type)).append(
							"\"/>");
				else
					ret.append("<p n=\"").append(name).append(
							"\" s:nvl=\"true\" s:t=\"").append(
							ValueObjectUtil.getSimpleTypeName(type)).append(
							"\"/>");

			} else {
				Set datas = (Set) obj;

				if (name == null)
					ret.append("<p s:t=\"").append(
							ValueObjectUtil.getSimpleTypeName(type)).append(
							"\">");
				else
				{
					ret.append("<p n=\"").append(name).append("\" s:t=\"")
							.append(ValueObjectUtil.getSimpleTypeName(type))
							.append("\">");
//					currentAddress = currentAddress + "->" + name;
				}
				ret.append("<s cmt=\"bean\">");
				Object value = null;
				Iterator itr = datas.iterator();
				int i = 0;
				while (itr.hasNext())

				{
					value = itr.next();
					if (value == null)
						convertBeanObjectToXML(null, value, null, dateformat,
								ret,serialStack,currentAddress + "[" + i + "]");
					else
						convertBeanObjectToXML(null, value, value.getClass(),
								dateformat, ret,serialStack,currentAddress + "[" + i + "]");
					i ++;
				}
				ret.append("</s>");
				ret.append("</p>");
			}

		} else if (type != null && Map.class.isAssignableFrom(type)) {
			if (obj == null) {
				if (name == null)
					ret.append("<p s:nvl=\"true\" s:t=\"").append(
							ValueObjectUtil.getSimpleTypeName(type)).append(
							"\"/>");
				else
					ret.append("<p n=\"").append(name).append(
							"\" s:nvl=\"true\" s:t=\"").append(
							ValueObjectUtil.getSimpleTypeName(type)).append(
							"\"/>");

			} else {
				Map datas = (Map) obj;

				if (name == null)
					ret.append("<p s:t=\"").append(
							ValueObjectUtil.getSimpleTypeName(type)).append(
							"\">");
				else
				{
					ret.append("<p n=\"").append(name).append("\" s:t=\"")
							.append(ValueObjectUtil.getSimpleTypeName(type))
							.append("\">");
//					currentAddress = currentAddress + "->" + name;
				}
				ret.append("<m cmt=\"bean\">");
				Object value = null;
				Iterator itr = datas.entrySet().iterator();
				while (itr.hasNext())

				{
					Map.Entry entry = (Map.Entry) itr.next();
					value = entry.getValue();
					if (value == null)
						convertBeanObjectToXML(String.valueOf(entry.getKey()),
								value, null, dateformat, ret,serialStack,currentAddress + "[" + entry.getKey() + "]");
					else
						convertBeanObjectToXML(String.valueOf(entry.getKey()),
								value, value.getClass(), dateformat, ret,serialStack,currentAddress + "[" + entry.getKey() + "]");
				}
				ret.append("</m>");
				ret.append("</p>");
			}

		} else if (type != null && type.isArray()) {

			if (obj == null) {
				if (name == null)
					ret.append("<p s:nvl=\"true\" s:t=\"").append(
							ValueObjectUtil.getTypeName(type)).append(
							"\"/>");
				else
					ret.append("<p n=\"").append(name).append(
							"\" s:nvl=\"true\" s:t=\"").append(
							ValueObjectUtil.getTypeName(type)).append(
							"\"/>");
				return;
			} else {
//				if (name == null)
//					ret.append("<p s:t=\"").append(
//							ValueObjectUtil.getSimpleTypeName(type)).append(
//							"\">");
//				else
//				{
//					ret.append("<p n=\"").append(name).append("\" s:t=\"")
//							.append(ValueObjectUtil.getSimpleTypeName(type))
//							.append("\">");
//					currentAddress = currentAddress + "->" + name;
//				}
				
				if (name == null)
					ret.append("<p s:t=\"").append(
							ValueObjectUtil.getTypeName(type)).append(
							"\">");
				else
				{
					ret.append("<p n=\"").append(name).append("\" s:t=\"")
							.append(ValueObjectUtil.getTypeName(type))
							.append("\">");
//					currentAddress = currentAddress + "->" + name;
				}

			}
			ret.append("<a cmt=\"").append(
					ValueObjectUtil.getComponentTypeName(type)).append("\">");
			Object value = null;
			int len = Array.getLength(obj);

			for (int i = 0; i < len; i++) {
				value = Array.get(obj, i);

				if (value == null)
					convertBeanObjectToXML(null, value, null, dateformat, ret,serialStack,currentAddress + "[" + i + "]");
				else
					convertBeanObjectToXML(null, value, value.getClass(),
							dateformat, ret,serialStack,currentAddress + "[" + i + "]");
			}
			ret.append("</a>");
			ret.append("</p>");
		}

		else {
			basicTypeCast(name, obj, type, dateformat, ret, serialStack,currentAddress);
		}

		// Object arrayObj;
		//
		// /**
		// * 基本类型转换和基本类型之间相互转换
		// */
		// if (!type.isArray() && !toType.isArray()) {
		// arrayObj = basicTypeCast(obj, type, toType, dateformat);
		// }
		//
		// /**
		// * 字符串数组向其他类型数组之间转换 数组和数组之间的转换 基础类型数据向数组转换
		// */
		// else {
		//
		// arrayObj = arrayTypeCast(obj, type, toType, dateformat);
		// }
		// return arrayObj;
	}

	/**
	 * Description:基本的数据类型转圜
	 * 
	 * @param obj
	 * @param type
	 * @param toType
	 * @return Object
	 * @throws NoSupportTypeCastException
	 * @throws NumberFormatException
	 * @throws IntrospectionException
	 * @throws IOException 
	 * 
	 */
	private final static boolean basicTypeCast(String name, Object obj,
			Class type, String dateformat, Writer ret,SerialStack stack,String currentAddress)
			throws NoSupportTypeCastException, NumberFormatException,
			IntrospectionException, IOException {
		if (obj == null) {
			if (name == null)
				ret.append("<p s:nvl=\"true\" s:t=\"").append(
						ValueObjectUtil.getSimpleTypeName(type)).append("\"/>");
			else
				ret.append("<p n=\"").append(name).append(
						"\" s:nvl=\"true\" s:t=\"").append(
						ValueObjectUtil.getSimpleTypeName(type)).append("\"/>");

			return true;
		}

		type = obj.getClass();
		//		
		// if (type.isAssignableFrom(toType)) //
		// type是toType的父类，父类向子类转换的过程，这个转换过程是不安全的
		// {
		// if (!java.util.Date.class.isAssignableFrom(type))
		// return shell(toType, obj);
		// }
		/**
		 * 如果obj的类型不是String型时直接抛异常, 不支持非字符串和字符串数组的类型转换
		 */
		// if (type != String.class)
		// throw new NoSupportTypeCastException(
		// new StringBuffer("不支持[")
		// .append(type)
		// .append("]向[")
		// .append(toType)
		// .append("]的转换")
		// .toString());
		/*******************************************
		 * 字符串向基本类型及其包装器转换 * 如果obj不是相应得数据格式,将抛出 * NumberFormatException *
		 ******************************************/
		if (type == long.class || type == Long.class) {
			// if (ValueObjectUtil.isNumber(obj))
			// return ((Number) obj).longValue();
			// else if (java.util.Date.class.isAssignableFrom(type)) {
			// return ((java.util.Date) obj).getTime();
			// }
			// return Long.parseLong(obj.toString());
			if (name == null)
				ret.append("<p s:t=\"long\" v=\"").append(obj.toString()).append("\"/>");
			else
				ret.append("<p n=\"").append(name).append(
						"\" s:t=\"long\" v=\"").append(obj.toString()).append("\"/>");

			return true;
		}
		if (type == int.class || type == Integer.class) {
			if (name == null)
				ret.append("<p s:t=\"int\" v=\"").append(obj.toString()).append("\"/>");
			else
				ret.append("<p n=\"").append(name)
						.append("\" s:t=\"int\" v=\"").append(obj.toString()).append(
								"\"/>");

			return true;
		}
		if (type == float.class || type == Float.class) {
			if (name == null)
				ret.append("<p s:t=\"float\" v=\"").append(obj.toString()).append("\"/>");
			else
				ret.append("<p n=\"").append(name).append(
						"\" s:t=\"float\" v=\"").append(obj.toString()).append("\"/>");

			return true;
		}
		if (type == short.class || type == Short.class) {
			if (name == null)
				ret.append("<p s:t=\"short\" v=\"").append(obj.toString()).append("\"/>");
			else
				ret.append("<p n=\"").append(name).append(
						"\" s:t=\"short\" v=\"").append(obj.toString()).append("\"/>");
			return true;
		}
		if (type == double.class || type == Double.class) {
			if (name == null)
				ret.append("<p s:t=\"double\" v=\"").append(obj.toString()).append("\"/>");
			else
				ret.append("<p n=\"").append(name).append(
						"\" s:t=\"double\" v=\"").append(obj.toString()).append("\"/>");
			return true;
		}
		if (type == char.class || type == Character.class) {
			if (name == null)
				ret.append("<p s:t=\"char\" v=\"").append(obj.toString()).append("\"/>");
			else
				ret.append("<p n=\"").append(name).append(
						"\" s:t=\"char\" v=\"").append(obj.toString()).append("\"/>");
			return true;
		}

		if (type == boolean.class || type == Boolean.class) {
			if (name == null)
				ret.append("<p s:t=\"boolean\" v=\"").append(obj.toString())
						.append("\"/>");
			else
				ret.append("<p n=\"").append(name).append(
						"\" s:t=\"boolean\" v=\"").append(obj.toString()).append("\"/>");
			return true;
		}

		if (type == byte.class || type == Byte.class) {
			if (name == null)
				ret.append("<p s:t=\"byte\" v=\"").append(obj.toString()).append("\"/>");
			else
				ret.append("<p n=\"").append(name).append(
						"\" s:t=\"byte\" v=\"").append(obj.toString()).append("\"/>");
			return true;
		}

		// 如果是字符串则直接返回obj.toString()
		if (type == String.class) {
			if (name == null)
				ret.append("<p s:t=\"String\" v=\"").append(obj.toString()).append("\"/>");
			else
				ret.append("<p n=\"").append(name).append(
						"\" s:t=\"String\" v=\"").append(obj.toString()).append("\"/>");
			return true;
		} else if (java.util.Date.class.isAssignableFrom(type)) {
			// String value = ValueObjectUtil.getDateFormat(dateformat).format(
			// (java.util.Date) obj);
			long value = ((java.util.Date) obj).getTime();
			if (name == null)
				ret.append("<p s:t=\"").append(
						ValueObjectUtil.getSimpleTypeName(type)).append(
						"\" v=\"").append(String.valueOf(value)).append("\"/>");
			else
				ret.append("<p n=\"").append(name).append("\" s:t=\"").append(
						ValueObjectUtil.getSimpleTypeName(type)).append(
						"\" v=\"").append(String.valueOf(value)).append("\"/>");
			return true;
		} else if (type == Class.class) {
			if (name == null)
				ret.append("<p s:t=\"Class\" v=\"").append(
						((Class) obj).getCanonicalName()).append("\"/>");
			else
				ret.append("<p n=\"").append(name).append(
						"\" s:t=\"Class\" v=\"").append(
						((Class) obj).getCanonicalName()).append("\"/>");
			return true;
		} else if (type.isEnum()) {
			if (name == null)
				ret.append("<p s:t=\"").append(
						ValueObjectUtil.getSimpleTypeName(type)).append(
						"\" v=\"").append(obj.toString()).append("\"/>");
			else
				ret.append("<p n=\"").append(name).append("\" s:t=\"").append(
						ValueObjectUtil.getSimpleTypeName(type)).append(
						"\" v=\"").append(obj.toString()).append("\"/>");
			return true;
		}

		else // 对象转换及对象状态转换
		{
			if (name == null)
				ret.append("<p cs=\"")
						.append(obj.getClass().getCanonicalName())
						.append("\">");
			else
				ret.append("<p n=\"").append(name).append("\" cs=\"").append(
						obj.getClass().getCanonicalName()).append("\">");
			if (StackTraceElement.class.isAssignableFrom(type))
				appendStackTraceElementProperties(obj, type, dateformat, ret, stack,currentAddress);
			else if (Throwable.class.isAssignableFrom(type))
				appendThrowableProperties(obj, type, dateformat, ret,stack,currentAddress);
			else
				appendBeanProperties(obj, type, dateformat, ret,stack,currentAddress);
			ret.append("</p>");
			return true;
		}

	}

	private static void appendThrowableProperties(Object obj, Class type,
			String dateformat, Writer ret,SerialStack stack,String currentAddress) throws IntrospectionException, IOException {

//		BeanInfo beanInfo = Introspector.getBeanInfo(type);
//		ClassInfo beanInfo = ClassUtil.getClassInfo(type);
//
//		List<PropertieDescription> attributes = beanInfo.getPropertyDescriptors();

		ret.append("<construction>");

		try {

			Object value = ValueObjectUtil.getValue(obj, "message");

			convertBeanObjectToXML("message", value, String.class, dateformat,
					ret,stack,currentAddress + "{0}"  );
			value = ValueObjectUtil.getValue(obj, "cause");
			if (value != null) {
				convertBeanObjectToXML("cause", value, value.getClass(),
						dateformat, ret,stack,currentAddress + "{1}" );
			} else {
				convertBeanObjectToXML("cause", value, Throwable.class,
						dateformat, ret,stack,currentAddress + "{2}" );
			}

		} catch (CurrentlyInCreationException e) {
			throw e;
		} catch (BeanInstanceException e) {
			throw e;
		}

		catch (Exception e) {
			// e.printStackTrace();
			throw new CurrentlyInCreationException("", e);
		}

		ret.append("</construction>");

		appendBeanProperties(obj, type, dateformat, ret,
				throwable_filterattributes,stack,currentAddress);

	}

	private static void appendStackTraceElementProperties(Object obj,
			Class type, String dateformat, Writer ret,SerialStack serialStack,String currentAddress)
			throws IntrospectionException, IOException {

//		BeanInfo beanInfo = Introspector.getBeanInfo(type);
//
//		PropertyDescriptor[] attributes = beanInfo.getPropertyDescriptors();

		ret.append("<construction>");

		try {

			Object value = ValueObjectUtil.getValue(obj, "className");

			convertBeanObjectToXML("declaringClass", value, String.class,
					dateformat, ret,serialStack, currentAddress + "{0}");
			value = ValueObjectUtil.getValue(obj, "methodName");

			convertBeanObjectToXML("methodName", value, String.class,
					dateformat, ret,serialStack, currentAddress + "{1}");
			value = ValueObjectUtil.getValue(obj, "fileName");

			convertBeanObjectToXML("fileName", value, String.class, dateformat,
					ret,serialStack, currentAddress + "{2}");
			value = ValueObjectUtil.getValue(obj, "lineNumber");

			convertBeanObjectToXML("lineNumber", value, int.class, dateformat,
					ret,serialStack, currentAddress + "{3}");
		} catch (CurrentlyInCreationException e) {
			throw e;
		} catch (BeanInstanceException e) {
			throw e;
		}

		catch (Exception e) {
			// e.printStackTrace();
			throw new CurrentlyInCreationException("", e);
		}

		ret.append("</construction>");

	}

	private static void appendBeanProperties(Object obj, Class type,
			String dateformat, Writer ret,SerialStack stack,String currentAddress) throws IntrospectionException {

		appendBeanProperties(obj, type, dateformat, ret, null, stack,currentAddress);

	}

	private static boolean isexclusive(String name, String[] filters) {
		if (filters == null || filters.length == 0)
			return false;
		for (String filter : filters) {
			if (name.equals(filter))
				return true;
		}
		return false;
	}

	private static void appendBeanProperties(Object obj, Class type,
			String dateformat, Writer ret, String[] filters,SerialStack stack,String currentAddress)
			throws IntrospectionException {
		ClassInfo beanInfo = ClassUtil.getClassInfo(type);		
//		beanInfo_.getDeclaredFields();
//		beanInfo_.getPropertyDescriptor("");
		
//		BeanInfo beanInfo = Introspector.getBeanInfo(type);
//		PropertyDescriptor[] attributes = beanInfo.getPropertyDescriptors();
		List<PropertieDescription> attributes = beanInfo.getPropertyDescriptors();
		for (int n = 0; attributes != null && n < attributes.size(); n++) {

			// get bean attribute name
			PropertieDescription propertyDescriptor = attributes.get(n);
			String attrName = propertyDescriptor.getName();
//			if (attrName.equals("class"))
//				continue;
//			else 
			if (isexclusive(attrName, filters)) {
				continue;
			}
			Class ptype = propertyDescriptor.getPropertyType();

			// create attribute value of correct type
//			Method readmethod = propertyDescriptor.getReadMethod();
//			Method writermethod = propertyDescriptor.getWriteMethod();
//			if ((readmethod == null || writermethod == null) && propertyDescriptor.getField() == null )
			if(!propertyDescriptor.canseriable())
				continue;
 
			try {

				Object value = propertyDescriptor.getValue(obj);
				if (value != null)
					ptype = value.getClass();
				
				convertBeanObjectToXML(attrName, value, ptype, dateformat, ret,stack,currentAddress + "->" + attrName);
			} catch (IllegalArgumentException e) {
				throw new CurrentlyInCreationException("", e);
			} catch (IllegalAccessException e) {
				throw new CurrentlyInCreationException("", e);
			} catch (InvocationTargetException e) {
				throw new CurrentlyInCreationException("", e);
			} catch (CurrentlyInCreationException e) {
				throw e;
			} catch (BeanInstanceException e) {
				throw e;
			}

			catch (Exception e) {
				// e.printStackTrace();
				throw new CurrentlyInCreationException("", e);
			}

		}

	}

	private static void convertParams(Writer ret, Object[] params,
			Class[] paramTypes, String dateformat,SerialStack stack,String currentAddress)
			throws NoSupportTypeCastException, NumberFormatException,
			IllegalArgumentException, IntrospectionException, IOException {
		
		for (int i = 0; i < params.length; i++) {
			ObjectSerializable.convertBeanObjectToXML(null, params[i],
					paramTypes[i], dateformat, ret, stack,currentAddress + "[" + i+"]");
		}
	}

}
