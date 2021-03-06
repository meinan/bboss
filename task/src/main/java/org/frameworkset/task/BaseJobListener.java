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

package org.frameworkset.task;

import org.frameworkset.spi.ApplicationContextAware;
import org.frameworkset.spi.BaseApplicationContext;
import org.frameworkset.spi.BeanInfoAware;
import org.quartz.JobListener;

import com.frameworkset.spi.assemble.BeanInstanceException;

/**
 * <p>Title: BaseJobListener.java</p> 
 * <p>Description: </p>
 * <p>bboss workgroup</p>
 * <p>Copyright (c) 2007</p>
 * @Date 2013-1-23 上午10:31:34
 * @author biaoping.yin
 * @version 1.0
 */
public abstract class BaseJobListener  extends BeanInfoAware  implements ApplicationContextAware,JobListener {
	protected BaseApplicationContext applicationContext;
	

	public void setApplicationContext(BaseApplicationContext applicationContext)
			throws BeanInstanceException {
		this.applicationContext = applicationContext;

	}
	public BaseJobListener() {
		// TODO Auto-generated constructor stub
	}
	public String getName()
	{
		return super.beaninfo.getName();
	}


}
