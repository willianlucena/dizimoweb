
<%@ page import="br.com.maxinfo.dizimo.Endereco" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'endereco.label', default: 'Endereco')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'endereco.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="codCidade" title="${message(code: 'endereco.codCidade.label', default: 'Cod Cidade')}" />
                        
                            <g:sortableColumn property="complemento" title="${message(code: 'endereco.complemento.label', default: 'Complemento')}" />
                        
                            <g:sortableColumn property="pais" title="${message(code: 'endereco.pais.label', default: 'Pais')}" />
                        
                            <g:sortableColumn property="numero" title="${message(code: 'endereco.numero.label', default: 'Numero')}" />
                        
                            <g:sortableColumn property="bairro" title="${message(code: 'endereco.bairro.label', default: 'Bairro')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${enderecoInstanceList}" status="i" var="enderecoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${enderecoInstance.id}">${fieldValue(bean: enderecoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: enderecoInstance, field: "codCidade")}</td>
                        
                            <td>${fieldValue(bean: enderecoInstance, field: "complemento")}</td>
                        
                            <td>${fieldValue(bean: enderecoInstance, field: "pais")}</td>
                        
                            <td>${fieldValue(bean: enderecoInstance, field: "numero")}</td>
                        
                            <td>${fieldValue(bean: enderecoInstance, field: "bairro")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${enderecoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
