
<%@ page import="br.com.maxinfo.dizimo.Doacoes" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'doacoes.label', default: 'Doacoes')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'doacoes.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="valor" title="${message(code: 'doacoes.valor.label', default: 'Valor')}" />
                        
                            <g:sortableColumn property="data" title="${message(code: 'doacoes.data.label', default: 'Data')}" />
                        
                            <th><g:message code="doacoes.igreja.label" default="Igreja" /></th>
                   	    
                            <g:sortableColumn property="descricao" title="${message(code: 'doacoes.descricao.label', default: 'Descricao')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${doacoesInstanceList}" status="i" var="doacoesInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${doacoesInstance.id}">${fieldValue(bean: doacoesInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: doacoesInstance, field: "valor")}</td>
                        
                            <td><g:formatDate date="${doacoesInstance.data}" /></td>
                        
                            <td>${fieldValue(bean: doacoesInstance, field: "igreja")}</td>
                        
                            <td>${fieldValue(bean: doacoesInstance, field: "descricao")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${doacoesInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
