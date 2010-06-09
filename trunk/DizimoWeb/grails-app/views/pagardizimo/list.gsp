
<%@ page import="br.com.maxinfo.dizimo.Pagardizimo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pagardizimo.label', default: 'Pagardizimo')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'pagardizimo.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="dataPagamento" title="${message(code: 'pagardizimo.dataPagamento.label', default: 'Data Pagamento')}" />
                        
                            <g:sortableColumn property="valor" title="${message(code: 'pagardizimo.valor.label', default: 'Valor')}" />
                        
                            <g:sortableColumn property="anoReferencia" title="${message(code: 'pagardizimo.anoReferencia.label', default: 'Ano Referencia')}" />
                        
                            <g:sortableColumn property="mesReferencia" title="${message(code: 'pagardizimo.mesReferencia.label', default: 'Mes Referencia')}" />
                        
                            <th><g:message code="pagardizimo.igreja.label" default="Igreja" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${pagardizimoInstanceList}" status="i" var="pagardizimoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${pagardizimoInstance.id}">${fieldValue(bean: pagardizimoInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatDate date="${pagardizimoInstance.dataPagamento}" /></td>
                        
                            <td>${fieldValue(bean: pagardizimoInstance, field: "valor")}</td>
                        
                            <td>${fieldValue(bean: pagardizimoInstance, field: "anoReferencia")}</td>
                        
                            <td>${fieldValue(bean: pagardizimoInstance, field: "mesReferencia")}</td>
                        
                            <td>${fieldValue(bean: pagardizimoInstance, field: "igreja")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${pagardizimoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
