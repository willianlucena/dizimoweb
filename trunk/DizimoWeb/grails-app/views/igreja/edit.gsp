
<%@ page import="br.com.maxinfo.dizimo.Igreja" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'igreja.label', default: 'Igreja')}" />
        <title>Editar Igreja</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${igrejaInstance}">
            <div class="errors">
                <g:renderErrors bean="${igrejaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${igrejaInstance?.id}" />
                <g:hiddenField name="version" value="${igrejaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="doacoes"><g:message code="igreja.doacoes.label" default="Doacoes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: igrejaInstance, field: 'doacoes', 'errors')}">

<ul>
<g:each in="${igrejaInstance?.doacoes?}" var="d">
    <li><g:link controller="doacoes" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="doacoes" action="create" params="['igreja.id': igrejaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'doacoes.label', default: 'Doacoes')])}</g:link>

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="coordenador"><g:message code="igreja.coordenador.label" default="Coordenador" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: igrejaInstance, field: 'coordenador', 'errors')}">
                                    <g:textField name="coordenador" value="${igrejaInstance?.coordenador}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nome"><g:message code="igreja.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: igrejaInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" value="${igrejaInstance?.nome}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="endereco"><g:message code="igreja.endereco.label" default="Endereco" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: igrejaInstance, field: 'endereco', 'errors')}">
                                    <g:select name="endereco.id" from="${br.com.maxinfo.dizimo.Endereco.list()}" optionKey="id" value="${igrejaInstance?.endereco?.id}"  />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="pagardizimos"><g:message code="igreja.pagardizimos.label" default="Pagardizimos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: igrejaInstance, field: 'pagardizimos', 'errors')}">

<ul>
<g:each in="${igrejaInstance?.pagardizimos?}" var="p">
    <li><g:link controller="pagardizimo" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="pagardizimo" action="create" params="['igreja.id': igrejaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'pagardizimo.label', default: 'Pagardizimo')])}</g:link>

                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
