
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

                            <g:sortableColumn property="nome" title="${message(code: 'dizimista.nome.label', default: 'Nome')}" />
                            <g:sortableColumn property="nomeConjuge" title="${message(code: 'dizimista.nomeConjuge.label', default: 'Nome Conjuge')}" />
                            <g:sortableColumn property="dataCasamento" title="${message(code: 'dizimista.dataCasamento.label', default: 'Data Casamento')}" />
                            <g:sortableColumn property="dataPrimeiroPagamento" title="${message(code: 'dizimista.dataPrimeiroPagamento.label', default: 'Data Primeiro Pagamento')}" />
                            <g:sortableColumn property="endereco" title="${message(code: 'dizimista.endereco.label', default: 'Endereco')}" />
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${dizimistaInstanceList}" status="i" var="dizimistaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: dizimistaInstance, field: "usuario")}</td>
							<td>${fieldValue(bean: dizimistaInstance, field: "nomeConjuge")}</td>
                            <td><g:formatDate date="${dizimistaInstance.dataCasamento}"  type="datetime" style="MEDIUM" timeStyle="SHORT"/></td>
                            <td><g:formatDate date="${dizimistaInstance.dataPrimeiroPagamento}"  type="datetime" style="MEDIUM" timeStyle="SHORT"/></td>
                            <td>${dizimistaInstance.endereco.logradouro}, ${dizimistaInstance.endereco.numero} - ${dizimistaInstance.endereco.bairro}, ${dizimistaInstance.endereco.cidade}-${dizimistaInstance.endereco.estado}, ${dizimistaInstance.endereco.pais}</td>
                        	<td class="actionButtons">
                                <span class="actionButton">
                                    <b><g:link action="show" id="${dizimistaInstance.id}">Detalhes</g:link></b>
								</span>
                            </td>
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
