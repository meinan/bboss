﻿/*
 *  Copyright 2008 biaoping.yin
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

package org.frameworkset.spi.serviceidentity;

import java.util.StringTokenizer;

import org.apache.log4j.Logger;
import org.frameworkset.netty.NettyRPCServer;
import org.frameworkset.spi.ApplicationContext;
import org.frameworkset.spi.BaseApplicationContext;
import org.frameworkset.spi.remote.JGroupHelper;
import org.frameworkset.spi.remote.RPCAddress;
import org.frameworkset.spi.remote.RemoteException;
import org.frameworkset.spi.remote.ServiceID;
import org.frameworkset.spi.remote.Target;
import org.frameworkset.spi.remote.Util;
import org.frameworkset.spi.remote.http.HttpServer;
import org.frameworkset.spi.remote.mina.server.MinaRPCServer;
import org.frameworkset.spi.remote.restful.RestfulServiceManager;
import org.frameworkset.spi.remote.rmi.RMIServer;
import bboss.org.jgroups.Address;
import bboss.org.jgroups.blocks.GroupRequest;

/**
 * <p>Title: ServiceIDImpl.java</p> 
 * <p>Description: </p>
 * <p>bboss workgroup</p>
 * <p>Copyright (c) 2007</p>
 * @Date 2011-5-11 上午10:37:09
 * @author biaoping.yin
 * @version 1.0
 */
public class ServiceIDImpl extends BaseServiceIDImpl{
	private static Logger log = Logger.getLogger(ServiceIDImpl.class);
      
    public static final boolean evaluatelocaladdress = Util.defaultContext.getBooleanProperty("rpc.evaluatelocaladdress", false);
   
	private boolean rpcserviceStarted(Target target)
    {
        if(target == null)
            return false;
        try
        
        {
            if (target.protocol_jgroup())
            {
                boolean started = JGroupHelper.getJGroupHelper().clusterstarted();
                if (!started)
                    throw new RemoteException("远程管理组件没有正常启动。无法调用远程服务[" + serviceID + "]");
                return started;
            }
            else if (target.protocol_mina())
            {
                return MinaRPCServer.getMinaRPCServer().started();
            }

            else if (target.protocol_netty())
            {
                return NettyRPCServer.getNettyRPCServer().started();
            }
            else if (target.protocol_rmi())
            {
                return RMIServer.getRMIServer().started();
            }
            else if (target.protocol_http())
            {
                return HttpServer.getHttpServer().started();
            }
            else if (target.protocol_jms())
            {
                return true;
            }
            else if (target.protocol_webservice())
            {
                return true;
            }
            else if(target.protocol_rest())
            {
            	return true;
            }
            else
            {
                throw new RuntimeException("未支持的地址：" + target);
            }
        }
        catch (RemoteException e)
        {
            throw e;
        }
        catch (RuntimeException e)
        {
            throw e;
        }

        catch (Exception e)
        {
            log.error("判断 rpcservice(" + target + ")是否启动失败：", e);
            return false;
        }

    }
	
	private boolean computeAgain()
	{
	    if(this.nextRestNode.equals(TargetImpl.REST_LOCAL))
        {
            isremote = false;
            return true;
        }
        else
        {
            String[] nodes = TargetImpl.parserRestFulPath(nextRestNode);
            this.fistRestNode = nodes[0];
            this.nextRestNode = nodes[1];
            this.rest = RestfulServiceManager.getRestfulServiceManager().convert(this,this.applicationcontext_);                        
            return this.isLocalAddress(this.getRestfulTarget(), true);
        }
	}

    private boolean isLocalAddress(Target target,boolean fromrest)
    {
    	if(!evaluatelocaladdress)
    		return false;
        if(target == null)
            return false;
        
        if (target.protocol_jgroup())
        {
            Address address = (Address) JGroupHelper.getJGroupHelper().getLocalAddress();
            if (this.compared(address, target))
            {
                if(fromrest)//restful风格地址处理
                {
                    //继续计算下个地址
//                    if(this.nextRestNode.equals(Target.REST_LOCAL))
//                    {
//                        isremote = false;
//                        return true;
//                    }
//                    else
//                    {
//                        String[] nodes = Target.parserRestFulPath(nextRestNode);
//                        this.fistRestNode = nodes[0];
//                        this.nextRestNode = nodes[1];
//                        this.rest = RestfulServiceManager.getRestfulServiceManager().convert(this);                        
//                        return this.isLocalAddress(this.getRestfulTarget(), true);
//                    }
                    return computeAgain();
                }
                else
                {
                    isremote = false;
                    return true;
                }
                
            }
            return false;
        }
        else if (target.protocol_mina())
        {
//            if (MinaRPCServer.getMinaRPCServer().started())
            
            if (compared(Util.getRPCIOHandler(Target.BROADCAST_TYPE_MINA).getLocalAddress(), target))
            {
                if(fromrest)//restful风格地址处理
                {
                    //继续计算下个地址
//                    if(this.nextRestNode.equals(Target.REST_LOCAL))
//                    {
//                        isremote = false;
//                        return true;
//                    }
//                    else
//                    {
//                        String[] nodes = Target.parserRestFulPath(nextRestNode);
//                        this.fistRestNode = nodes[0];
//                        this.nextRestNode = nodes[1];
//                        this.rest = RestfulServiceManager.getRestfulServiceManager().convert(this);                        
//                        return this.isLocalAddress(this.getRestfulTarget(), true);
//                    }
                    return computeAgain();
                }
                else
                {
                    isremote = false;
                    return true;
                }
            }
            
            return false;
        }
        else if (target.protocol_netty())
        {
//            if (MinaRPCServer.getMinaRPCServer().started())
            
            if (compared(Util.getRPCIOHandler(Target.BROADCAST_TYPE_NETTY).getLocalAddress(), target))
            {
                if(fromrest)//restful风格地址处理
                {
                    //继续计算下个地址
//                    if(this.nextRestNode.equals(Target.REST_LOCAL))
//                    {
//                        isremote = false;
//                        return true;
//                    }
//                    else
//                    {
//                        String[] nodes = Target.parserRestFulPath(nextRestNode);
//                        this.fistRestNode = nodes[0];
//                        this.nextRestNode = nodes[1];
//                        this.rest = RestfulServiceManager.getRestfulServiceManager().convert(this);                        
//                        return this.isLocalAddress(this.getRestfulTarget(), true);
//                    }
                    return computeAgain();
                }
                else
                {
                    isremote = false;
                    return true;
                }
            }
            
            return false;
        }
        else if (target.protocol_jms())
        {
            if (this.compared(Util.getRPCIOHandler(Target.BROADCAST_TYPE_JMS).getLocalAddress(), target))
            {
                if(fromrest)//restful风格地址处理
                {
                    //继续计算下个地址
//                    if(this.nextRestNode.equals(Target.REST_LOCAL))
//                    {
//                        isremote = false;
//                        return true;
//                    }
//                    else
//                    {
//                        String[] nodes = Target.parserRestFulPath(nextRestNode);
//                        this.fistRestNode = nodes[0];
//                        this.nextRestNode = nodes[1];
//                        this.rest = RestfulServiceManager.getRestfulServiceManager().convert(this);                        
//                        return this.isLocalAddress(this.getRestfulTarget(), true);
//                    }
                    return computeAgain();
                }
                else
                {
                    isremote = false;
                    return true;
                }
            }
            
            return false;
//            return this.compared(Util.getRPCIOHandler(Target.BROADCAST_TYPE_JMS).getLocalAddress(), target);
        }
        else if (target.protocol_webservice())
        {
            if (this.compared(Util.getRPCIOHandler(Target.BROADCAST_TYPE_WEBSERVICE).getLocalAddress(), target))
            {
                if(fromrest)//restful风格地址处理
                {
                    //继续计算下个地址
//                    if(this.nextRestNode.equals(Target.REST_LOCAL))
//                    {
//                        isremote = false;
//                        return true;
//                    }
//                    else
//                    {
//                        String[] nodes = Target.parserRestFulPath(nextRestNode);
//                        this.fistRestNode = nodes[0];
//                        this.nextRestNode = nodes[1];
//                        this.rest = RestfulServiceManager.getRestfulServiceManager().convert(this);                        
//                        return this.isLocalAddress(this.getRestfulTarget(), true);
//                    }
                    return computeAgain();
                }
                else
                {
                    isremote = false;
                    return true;
                }
            }
            
            return false;
//            return this.compared(Util.getRPCIOHandler(Target.BROADCAST_TYPE_WEBSERVICE).getLocalAddress(), target);
        }
        else if (target.protocol_ejb())
        {
            return false;
        }
        else if (target.protocol_rmi())
        {
            return false;
        }
        else if (target.protocol_http())
        {
            return false;
        }
        
        else if (target.protocol_rest()) //Fixed local address
        {
            return this.isLocalAddress(this.getRestfulTarget(),true);
        }
        else
        {
            throw new RuntimeException("未支持协议的地址：" + target);
        }
    }

    public ServiceIDImpl(String serviceID,  int resultMode, long timeout, int resultType, int bean_type,BaseApplicationContext applicationcontext)
    {
        this(serviceID, null, resultMode, timeout, resultType, bean_type,applicationcontext);
    }
    public ServiceIDImpl(String serviceID, String providerID, int resultMode, long timeout, int resultType, int bean_type,BaseApplicationContext applicationcontext)
    {
    	super(serviceID, providerID, resultMode, timeout, resultType, bean_type,(BaseApplicationContext)applicationcontext);
        this.buildService();
        isremote = this.target != null && !this.target.isSelf();
        if (this.isremote)
        {
//            rpcserviceStarted(target);

            // IpAddress address =
            // (IpAddress)JGroupHelper.getJGroupHelper().getLocalAddress();
            // if(this.compared(address, target))
            // {
            // isremote = false;
            // return;
            // }
            if (isLocalAddress(target,false))
            {
//                if(serviceID.equals("(jms::yinbiaoping-jms)/rpc.test"))
//                    isremote = true;
                return;
            }
            setLocalAddress();
        }

    }
    
    
    public ServiceIDImpl(String serviceID, String providerID,String applicationcontext,int containerType, int resultMode, long timeout, int resultType, int bean_type)
    {
    	super(serviceID, providerID,(String)applicationcontext, containerType, resultMode, timeout, resultType, bean_type);
    	
        this.buildService();
        isremote = this.target != null && !this.target.isSelf();
        if (this.isremote)
        {
//            rpcserviceStarted(target);

            // IpAddress address =
            // (IpAddress)JGroupHelper.getJGroupHelper().getLocalAddress();
            // if(this.compared(address, target))
            // {
            // isremote = false;
            // return;
            // }
            if (isLocalAddress(target,false))
            {
//                if(serviceID.equals("(jms::yinbiaoping-jms)/rpc.test"))
//                    isremote = true;
                return;
            }
            try {
				setLocalAddress();
			} catch (Exception e) {
				log.info(e.getMessage());
			}
        }

    }

    private void setLocalAddress()
    {
        if(target == null)
            return;
        if (target.protocol_jgroup())
        {
            Address address = (Address) JGroupHelper.getJGroupHelper().getLocalAddress();
//            this.sourceip = address.getIpAddress().getHostAddress();
//            this.sourceport = address.getPort() + "";
//            this.sourcename = address.getIpAddress().getHostName();
        }
        else if (target.protocol_mina() )
        {
            RPCAddress address = MinaRPCServer.getMinaRPCServer().getLocalAddress();
            if (address != null)
            {
                this.sourceip = address.getIp();
                this.sourceport = address.getPort() + "";
                // this.sourcename = address.getIpAddress().getHostName();
                this.sourcename = sourceip;
            }
        }
        else if (target.protocol_netty())
        {
            RPCAddress address = NettyRPCServer.getNettyRPCServer().getLocalAddress();
            if (address != null)
            {
                this.sourceip = address.getIp();
                this.sourceport = address.getPort() + "";
                // this.sourcename = address.getIpAddress().getHostName();
                this.sourcename = sourceip;
            }
        }
        else if (target.protocol_jms())
        {
            // return false;
        }
        
        else if (target.protocol_rmi())
        {
        	RPCAddress address = RMIServer.getRMIServer().getLocalAddress();
            if (address != null)
            {
                this.sourceip = address.getIp();
                this.sourceport = address.getPort() + "";
                // this.sourcename = address.getIpAddress().getHostName();
                this.sourcename = sourceip;
            }
        }
        else if (target.protocol_http())
        {
        	RPCAddress address = HttpServer.getHttpServer().getLocalAddress();
            if (address != null)
            {
                this.sourceip = address.getIp();
                this.sourceport = address.getPort() + "";
                // this.sourcename = address.getIpAddress().getHostName();
                this.sourcename = sourceip;
            }
        }
        else if (target.protocol_webservice())
        {
            // return false;
        }
        else if (target.protocol_rest())
        {
            // return false;
        }
        else
        {
            throw new RuntimeException("未支持协议的地址：" + target);
        }

    }

    public ServiceIDImpl(String serviceID, int resultMode, int waittime, int resultType, int bean_type,BaseApplicationContext applicationcontext)
    {
        this(serviceID, null, resultMode, waittime, resultType, bean_type, applicationcontext);

    }

    public boolean compared(Address address, Target target)
    {

        if (target.getTargets().size() == 1)
        {
        	RPCAddress t = target.getTargets().get(0);
        	Address address_ = (Address)t.getOrigineAddress();
        	
        	if(address_ == null)
        	{
        		String uuid = t.getServer_uuid();
        		return address.toString().equals(uuid);
        	}
        	else
        	{
        		return address_.compareTo(address) == 0;
        	}
        }
        return false;
    }

    public boolean compared(RPCAddress address, Target target)
    {

        if (target.getTargets().size() == 1)
        {
            RPCAddress address_ = (RPCAddress) target.getTargets().get(0);
            return address_.compare(address) == 0;
        }
        return false;
    }
    
   
    private void buildService()
    {
        StringTokenizer tokenizer = new StringTokenizer(this.serviceID, ")", false);
        int size = tokenizer.countTokens();
        if (size == 1)
        {
            this.service = tokenizer.nextToken();
        }
        else if(size == 2)
        {
            String target_ = tokenizer.nextToken();
            target_ = target_.substring(1, target_.length());
            target = new TargetImpl(target_);
            

            {
	            String temp = tokenizer.nextToken().substring(1);	            
	            int paramidx = temp.indexOf("?");
	            if(paramidx > -1)
	            {
	                urlParams = temp.substring(paramidx + 1);
	                this.service = temp.substring(0,paramidx);
	            }
	            else
	                this.service = temp;
            }
            if(target.protocol_rest()){
            	this.setRestStyle(target.protocol_rest());
            	this.fistRestNode = this.target.getFirstNode();
                this.nextRestNode = this.target.getNextNode();
            	this.rest = RestfulServiceManager.getRestfulServiceManager().convert(this,this.applicationcontext_);
            	
            }
        }
       
    }

    public static void main(String[] args)
    {
    	//默认的远程服务调用标识
        String serviceid = "(17:1010;18:1020)/serviceid";
        
        //webservice远程服务调用标识
        serviceid = "(webservice::http://17:1010/webroot/;http://17:1010/webroot/)/serviceid";

//        serviceid = "(all)/serviceid";
        ServiceID id = new ServiceIDImpl(serviceid, null, GroupRequest.GET_ALL, result_object, 0,
                ServiceID.PROVIDER_BEAN_SERVICE,null);
        System.out.println(id);

    }
    
    
    
    public String getNextRestfulServiceAddress(){
    	if(getNextRestNode().equals("_local_"))
    		return this.getService();
    	StringBuffer buffer = new StringBuffer();
    	buffer.append("(" ).append(Target.BROADCAST_TYPE_REST ).append( "::" ).append( this.getNextRestNode() ).append( ")/" ).append( this.getService());
    	return buffer.toString();
    }

	public ServiceIDImpl()
    {
    	
    }

}
