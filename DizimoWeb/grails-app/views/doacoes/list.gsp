
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
                        	<th><g:message code="doacoes.igreja.label" default="Igreja" /></th>
                        	<g:sortableColumn property="data" title="${message(code: 'doacoes.data.label', default: 'Data')}" />
                            <g:sortableColumn property="valor" title="${message(code: 'doacoes.valor.label', default: 'Valor')}" />
                            <g:sortableColumn property="descricao" title="${message(code: 'doacoes.descricao.label', default: 'Descricao')}" />
                       		<th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${doacoesInstanceList}" status="i" var="doacoesInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        	<td>${fieldValue(bean: doacoesInstance, field: "igreja")}</td>
                        	<td><g:formatDate date="${doacoesInstance.data}" type="datetime" style="MEDIUM" timeStyle="SHORT"/></td>
                            <td>${fieldValue(bean: doacoesInstance, field: "valor")}</td>
                            <td>${fieldValue(bean: doacoesInstance, field: "descricao")}</td>
                        	<td class="actionButtons">
                                <span class="actionButton">
                                    <b><g:link action="show" id="${doacoesInstance.id}">Detalhes</g:link></b>
								</span>
                            </td>
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
