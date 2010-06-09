
<%@ page import="br.com.maxinfo.dizimo.Dizimista" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dizimista.label', default: 'Dizimista')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
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
            <g:hasErrors bean="${dizimistaInstance}">
            <div class="errors">
                <g:renderErrors bean="${dizimistaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${dizimistaInstance?.id}" />
                <g:hiddenField name="version" value="${dizimistaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="usuario"><g:message code="dizimista.usuario.label" default="Usuario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dizimistaInstance, field: 'usuario', 'errors')}">
                                    <g:select name="usuario.id" from="${Usuario.list()}" optionKey="id" value="${dizimistaInstance?.usuario?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="doacoes"><g:message code="dizimista.doacoes.label" default="Doacoes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dizimistaInstance, field: 'doacoes', 'errors')}">
                                    <g:select name="doacoes" from="${br.com.maxinfo.dizimo.Doacoes.list()}" multiple="yes" optionKey="id" size="5" value="${dizimistaInstance?.doacoes*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dataCasamento"><g:message code="dizimista.dataCasamento.label" default="Data Casamento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dizimistaInstance, field: 'dataCasamento', 'errors')}">
                                    <g:datePicker name="dataCasamento" precision="day" value="${dizimistaInstance?.dataCasamento}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dataPrimeiroPagamento"><g:message code="dizimista.dataPrimeiroPagamento.label" default="Data Primeiro Pagamento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dizimistaInstance, field: 'dataPrimeiroPagamento', 'errors')}">
                                    <g:datePicker name="dataPrimeiroPagamento" precision="day" value="${dizimistaInstance?.dataPrimeiroPagamento}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nomeConjuge"><g:message code="dizimista.nomeConjuge.label" default="Nome Conjuge" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dizimistaInstance, field: 'nomeConjuge', 'errors')}">
                                    <g:textField name="nomeConjuge" value="${dizimistaInstance?.nomeConjuge}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dataAfastamento"><g:message code="dizimista.dataAfastamento.label" default="Data Afastamento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dizimistaInstance, field: 'dataAfastamento', 'errors')}">
                                    <g:datePicker name="dataAfastamento" precision="day" value="${dizimistaInstance?.dataAfastamento}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="pagardizimos"><g:message code="dizimista.pagardizimos.label" default="Pagardizimos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dizimistaInstance, field: 'pagardizimos', 'errors')}">
                                    
<ul>
<g:each in="${dizimistaInstance?.pagardizimos?}" var="p">
    <li><g:link controller="pagardizimo" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="pagardizimo" action="create" params="['dizimista.id': dizimistaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'pagardizimo.label', default: 'Pagardizimo')])}</g:link>

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
