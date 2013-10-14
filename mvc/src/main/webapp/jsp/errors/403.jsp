﻿<%--
 * Licensed under the GPL License. You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://probe.jstripe.com/d/license.shtml
 *
 * THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
 * WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
 --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" session="false" %>
<%@ taglib uri="/WEB-INF/pager-taglib.tld" prefix="pg"%>

<%--
    "403 - Forbidden" error handler.

    Author: Vlad Ilyushchenko
--%>

<html>

<head><title><pg:message code="probe.jsp.noaccess.title"/></title></head>

<body>
<div class="errorMessage">
    <p>
        <pg:message code="probe.jsp.noaccess"/>
    </p>
</div>
</body>
</html>