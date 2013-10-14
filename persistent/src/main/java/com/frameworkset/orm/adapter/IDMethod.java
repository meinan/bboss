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
package com.frameworkset.orm.adapter;

import java.io.Serializable;



/**
 * Interface for various ID retrieval method types
 * (i.e. auto-increment, sequence, ID broker, etc.).
 *
 * @author <a href="mailto:dlr@collab.net">Daniel Rall</a>
 * @version $Id: IDMethod.java,v 1.5 2005/01/31 19:43:55 tfischer Exp $
 */
public interface IDMethod extends Serializable
{
    /**
     * Key generation via database-specific ID method
     * (i.e. auto-increment for MySQL, sequence for Oracle, etc.).
     */
    String NATIVE = "native";

    /**
     * Key generation via auto-increment.
     */
    String AUTO_INCREMENT = "autoincrement";

    

    /**
     * Key generation via the IDBroker table.
     */
    String ID_BROKER = "idbroker";

    /**
     * No RDBMS key generation (keys may be generated by the
     * application).
     */
    String NO_ID_METHOD = "none";
}
