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
package org.frameworkset.spi.remote;


/**
 * 
 * <p>
 * Title: ServiceID.java
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * bboss workgroup
 * </p>
 * <p>
 * Copyright (c) 2007
 * </p>
 * 
 * @Date 2009-4-20 下午05:29:01
 * @author biaoping.yin
 * @version 1.0
 */
public interface ServiceID extends java.io.Serializable
{
    

    public static final int result_object = 0;

    public static final int result_first = 1;

    public static final int result_map = 2;

    public static final int result_rsplist = 3;

    public static final int result_list = 4;

    public static final int PROVIDER_BEAN_SERVICE = 0;

    public static final int PROPERTY_BEAN_SERVICE = 1;

   
    
       

    public int getBean_type();

    public int getResultMode();

    public long getTimeout();



    public int getResultType();

    public String getServiceID();

    public String getSourceip();

    public String getSourceport();

    public String getSourcename();

    
    public String getProviderID();

    

	


    public String getUrlParams();

    public void setUrlParams(String urlParams);
   
    public String getFistRestNode();
    
    public void setFistRestNode(String fistRestNode);

    public String getNextRestNode() ;

	public void setNextRestNode(String nextRestNode) ;
	
	public boolean isRestStyle();
	
	public void setRestStyle(boolean restStyle);

	public ServiceID getRestfulServiceID();
	
	public Target getRestfulTarget();
   
    
    public String getOrigineServiceID();
   
    public String getService();

    public Target getTarget();
    
    public String getNextRestfulServiceAddress();

    public boolean isRemote();
   

    public String getApplicationContext();

    public void setApplicationContext(String applicationContext);
    
    public int getContainerType();
    
    public void setContainerType(int containerType);
    
    /**
	 * @fixed biaoping.yin 2010-10-11
	 * @return the rest
	 */
	public ServiceID getRestServiceID() ;

}
