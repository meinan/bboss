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
package com.frameworkset.common.tag.pager.config;

import javax.servlet.jsp.JspException;

import com.frameworkset.common.tag.BaseTag;

/**
 * <p>Title: LinkTag.java</p> 
 * <p>Description: </p>
 * <p>bboss workgroup</p>
 * <p>Copyright (c) 2008</p>
 * @Date 2010-7-4
 * @author biaoping.yin
 * @version 1.0
 */
public class LinkTag extends BaseTag {
	private String src;
	
	@Override
	public int doEndTag() throws JspException {
		PageConfig.putLink(src, request, out);
		this.src = null;
		
		return super.doEndTag();
	}
}
