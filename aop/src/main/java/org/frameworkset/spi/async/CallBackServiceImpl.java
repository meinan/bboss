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

package org.frameworkset.spi.async;

/**
 * <p>Title: CallBackServiceImpl.java</p> 
 * <p>Description: </p>
 * <p>bboss workgroup</p>
 * <p>Copyright (c) 2007</p>
 * @Date 2011-4-21 下午06:21:48
 * @author biaoping.yin
 * @version 1.0
 */
public class CallBackServiceImpl implements CallBackService{
	private CallBack callBack;
	private long callTimeout;
	public CallBackServiceImpl(CallBack callBack, long callTimeout) {
		super();
		this.callBack = callBack;
		this.callTimeout = callTimeout;
	}
	public CallBackServiceImpl(CallBack callBack) {
		super();
		this.callBack = callBack;
		
	}

	public CallBack getCallBack() {		
		return callBack;
	}

	public long getCallTimeout() {
		return callTimeout;
	}

}
