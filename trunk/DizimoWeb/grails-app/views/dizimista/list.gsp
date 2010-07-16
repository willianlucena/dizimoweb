
<%@ page import="br.com.maxinfo.dizimo.Dizimista" %>
<%@ page import="br.com.maxinfo.dizimo.Endereco" %>
<%@ page import="br.com.maxinfo.dizimo.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Lista de Dizimistas</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Página Inicial</a></span>
            <span class="menuButton"><g:link class="create" action="create">Cadastrar Dizimista</g:link></span>
        </div>
        <div class="body">
            <h1>Lista de Dizimistas</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>

                            <g:sortableColumn property="id" title="${message(code: 'dizimista.id.label', default: 'Id')}" />
                        
                            <th><g:message code="dizimista.usuario.label" default="Usuario" /></th>
                   	    
                            <g:sortableColumn property="dataCasamento" title="${message(code: 'dizimista.dataCasamento.label', default: 'Data Casamento')}" />
                        
                            <g:sortableColumn property="dataPrimeiroPagamento" title="${message(code: 'dizimista.dataPrimeiroPagamento.label', default: 'Data Primeiro Pagamento')}" />
                        
                            <g:sortableColumn property="nomeConjuge" title="${message(code: 'dizimista.nomeConjuge.label', default: 'Nome Conjuge')}" />
                        
                            <g:sortableColumn property="dataAfastamento" title="${message(code: 'dizimista.dataAfastamento.label', default: 'Data Afastamento')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${dizimistaInstanceList}" status="i" var="dizimistaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${dizimistaInstance.id}">${fieldValue(bean: dizimistaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: dizimistaInstance, field: "usuario")}</td>
                        
                            <td><g:formatDate date="${dizimistaInstance.dataCasamento}" /></td>
                        
                            <td><g:formatDate date="${dizimistaInstance.dataPrimeiroPagamento}" /></td>
                        
                            <td>${fieldValue(bean: dizimistaInstance, field: "nomeConjuge")}</td>
                        
                            <td><g:formatDate date="${dizimistaInstance.dataAfastamento}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${dizimistaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
