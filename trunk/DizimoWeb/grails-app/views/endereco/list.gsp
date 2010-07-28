
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
                        
                            <g:sortableColumn property="bairro" title="${message(code: 'endereco.bairro.label', default: 'Bairro')}" />
                        
                            <g:sortableColumn property="cep" title="${message(code: 'endereco.cep.label', default: 'Cep')}" />
                        
                            <g:sortableColumn property="cidade" title="${message(code: 'endereco.cidade.label', default: 'Cidade')}" />
                        
                            <g:sortableColumn property="complemento" title="${message(code: 'endereco.complemento.label', default: 'Complemento')}" />
                        
                            <g:sortableColumn property="estado" title="${message(code: 'endereco.estado.label', default: 'Estado')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${enderecoInstanceList}" status="i" var="enderecoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${enderecoInstance.id}">${fieldValue(bean: enderecoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: enderecoInstance, field: "bairro")}</td>
                        
                            <td>${fieldValue(bean: enderecoInstance, field: "cep")}</td>
                        
                            <td>${fieldValue(bean: enderecoInstance, field: "cidade")}</td>
                        
                            <td>${fieldValue(bean: enderecoInstance, field: "complemento")}</td>
                        
                            <td>${fieldValue(bean: enderecoInstance, field: "estado")}</td>
                        
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
