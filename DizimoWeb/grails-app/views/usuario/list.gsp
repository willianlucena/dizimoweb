
<%@ page import="br.com.maxinfo.dizimo.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'usuario.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="username" title="${message(code: 'usuario.username.label', default: 'Username')}" />
                        
                            <g:sortableColumn property="userRealName" title="${message(code: 'usuario.userRealName.label', default: 'User Real Name')}" />
                        
                            
                        
                            <g:sortableColumn property="enabled" title="${message(code: 'usuario.enabled.label', default: 'Enabled')}" />
                        
                            <g:sortableColumn property="orgaoExpedidor" title="${message(code: 'usuario.orgaoExpedidor.label', default: 'Orgao Expedidor')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: usuarioInstance, field: "username")}</td>
                        
                            <td>${fieldValue(bean: usuarioInstance, field: "userRealName")}</td>
                                                    
                            <td><g:formatBoolean boolean="${usuarioInstance.enabled}" /></td>
                        
                            <td>${fieldValue(bean: usuarioInstance, field: "orgaoExpedidor")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${usuarioInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
