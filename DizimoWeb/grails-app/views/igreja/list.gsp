
<%@ page import="br.com.maxinfo.dizimo.Igreja" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'igreja.label', default: 'Igreja')}" />
        <title>Igrejas Cadastradas</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create">Nova Igreja</g:link></span>
        </div>
        <div class="body">
            <h1>Igrejas Cadastradas</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>

                            <g:sortableColumn property="id" title="${message(code: 'igreja.id.label', default: 'Id')}" />

                            <g:sortableColumn property="coordenador" title="${message(code: 'igreja.coordenador.label', default: 'Coordenador')}" />

                            <g:sortableColumn property="nome" title="${message(code: 'igreja.nome.label', default: 'Nome')}" />

                            <th><g:message code="igreja.endereco.label" default="Endereco" /></th>

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${igrejaInstanceList}" status="i" var="igrejaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:link action="show" id="${igrejaInstance.id}">${fieldValue(bean: igrejaInstance, field: "id")}</g:link></td>

                            <td>${fieldValue(bean: igrejaInstance, field: "coordenador")}</td>

                            <td>${fieldValue(bean: igrejaInstance, field: "nome")}</td>

                            <td>${igrejaInstance.endereco.logradouro}, ${igrejaInstance.endereco.numero} - ${igrejaInstance.endereco.bairro}, ${igrejaInstance.endereco.cidade}-${igrejaInstance.endereco.estado}, ${igrejaInstance.endereco.pais}</td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${igrejaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
