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

import java.util.Map;

import org.frameworkset.spi.BaseApplicationContext;
import org.frameworkset.spi.remote.ServiceID;


/**
 * <p>Title: ServiceIDUtil.java</p> 
 * <p>Description: </p>
 * <p>bboss workgroup</p>
 * <p>Copyright (c) 2007</p>
 * @Date 2011-5-11 下午02:49:58
 * @author biaoping.yin
 * @version 1.0
 */
public final class ServiceIDUtil {
	public static ServiceID buildServiceID(Map<String,ServiceID> serviceids,String serviceid, int serviceType, String providertype,BaseApplicationContext applicationcontext)
    {   
        String key = serviceid ;
        if(providertype != null)
            key = serviceid + "|" + providertype;
//        SoftReference<ServiceID> reference;
        ServiceID serviceID = serviceids.get(key);
        if (serviceID != null)
            return serviceID;
        
        synchronized (serviceids)
        {
            serviceID = serviceids.get(key);
            if (serviceID != null)
                return serviceID;
            long timeout = -1;
            serviceID = new DummyServiceIDImpl(serviceid, providertype, 2, timeout, ServiceID.result_rsplist,
                    serviceType, applicationcontext);
           
            serviceids.put(key, serviceID);
        }
        return serviceID;
        
        

    }
    
    public static ServiceID buildServiceID(String serviceid, int serviceType, BaseApplicationContext applicationcontext)
    {
       
//        SoftReference<ServiceID> reference;
        
        
        long timeout = -1;
        ServiceID serviceID = new DummyServiceIDImpl(serviceid, null, 2, timeout, ServiceID.result_rsplist,
                serviceType,applicationcontext);
           
           
        return serviceID;

    }

}
