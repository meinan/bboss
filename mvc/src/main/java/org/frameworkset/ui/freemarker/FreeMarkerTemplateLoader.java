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

package org.frameworkset.ui.freemarker;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;

import org.apache.log4j.Logger;
import org.frameworkset.util.io.Resource;
import org.frameworkset.util.io.ResourceLoader;

import freemarker.cache.TemplateLoader;

/**
 * FreeMarker TemplateLoader adapter that loads via a Bboss ResourceLoader.
 * Used by FreeMarkerConfigurationFactory for any resource loader path that
 * cannot be resolved to a java.io.File.
 *
 * @author Juergen Hoeller
 * @since 14.03.2004
 * @see FreeMarkerConfigurationFactory#setTemplateLoaderPath
 * @see freemarker.template.Configuration#setDirectoryForTemplateLoading
 */
public class FreeMarkerTemplateLoader implements TemplateLoader {

	protected final static Logger logger = Logger.getLogger(FreeMarkerTemplateLoader.class);

	private final ResourceLoader resourceLoader;

	private final String templateLoaderPath;


	/**
	 * Create a new BbossTemplateLoader.
	 * @param resourceLoader the Bboss ResourceLoader to use
	 * @param templateLoaderPath the template loader path to use
	 */
	public FreeMarkerTemplateLoader(ResourceLoader resourceLoader, String templateLoaderPath) {
		this.resourceLoader = resourceLoader;
		if (!templateLoaderPath.endsWith("/")) {
			templateLoaderPath += "/";
		}
		this.templateLoaderPath = templateLoaderPath;
		if (logger.isInfoEnabled()) {
			logger.info("BbossTemplateLoader for FreeMarker: using resource loader [" + this.resourceLoader +
					"] and template loader path [" + this.templateLoaderPath + "]");
		}
	}

	public Object findTemplateSource(String name) throws IOException {
		if (logger.isDebugEnabled()) {
			logger.debug("Looking for FreeMarker template with name [" + name + "]");
		}
		Resource resource = this.resourceLoader.getResource(this.templateLoaderPath + name);
		return (resource.exists() ? resource : null);
	}

	public Reader getReader(Object templateSource, String encoding) throws IOException {
		Resource resource = (Resource) templateSource;
		try {
			return new InputStreamReader(resource.getInputStream(), encoding);
		}
		catch (IOException ex) {
			if (logger.isDebugEnabled()) {
				logger.debug("Could not find FreeMarker template: " + resource);
			}
			throw ex;
		}
	}


	public long getLastModified(Object templateSource) {
		Resource resource = (Resource) templateSource;
		try {
			return resource.lastModified();
		}
		catch (IOException ex) {
			if (logger.isDebugEnabled()) {
				logger.debug("Could not obtain last-modified timestamp for FreeMarker template in " +
						resource + ": " + ex);
			}
			return -1;
		}
	}

	public void closeTemplateSource(Object templateSource) throws IOException {
	}

}
