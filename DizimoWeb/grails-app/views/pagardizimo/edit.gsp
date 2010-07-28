
<%@ page import="br.com.maxinfo.dizimo.Pagardizimo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <calendar:resources lang="br" theme="tiger"/>
        <g:set var="entityName" value="${message(code: 'pagardizimo.label', default: 'Pagardizimo')}" />
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
            <g:hasErrors bean="${pagardizimoInstance}">
            <div class="errors">
                <g:renderErrors bean="${pagardizimoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${pagardizimoInstance?.id}" />
                <g:hiddenField name="version" value="${pagardizimoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="valor"><g:message code="pagardizimo.valor.label" default="Valor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pagardizimoInstance, field: 'valor', 'errors')}">
                                    <input type="text" name="valor" value="${fieldValue(bean: pagardizimoInstance, field: 'valor')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="anoReferencia"><g:message code="pagardizimo.anoReferencia.label" default="Ano Referencia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pagardizimoInstance, field: 'anoReferencia', 'errors')}">
                                    <g:select name="anoReferencia" from="${pagardizimoInstance.constraints.anoReferencia.inList}" value="${pagardizimoInstance?.anoReferencia}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="mesReferencia"><g:message code="pagardizimo.mesReferencia.label" default="Mes Referencia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pagardizimoInstance, field: 'mesReferencia', 'errors')}">
                                    <g:select name="mesReferencia" from="${pagardizimoInstance.constraints.mesReferencia.inList}" value="${pagardizimoInstance?.mesReferencia}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="igreja"><g:message code="pagardizimo.igreja.label" default="Igreja" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pagardizimoInstance, field: 'igreja', 'errors')}">
                                    <g:select name="igreja.id" from="${br.com.maxinfo.dizimo.Igreja.list()}" optionKey="id" value="${pagardizimoInstance?.igreja?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dizimista"><g:message code="pagardizimo.dizimista.label" default="Dizimista" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pagardizimoInstance, field: 'dizimista', 'errors')}">
                                    <g:select name="dizimista.id" from="${br.com.maxinfo.dizimo.Dizimista.list()}" optionKey="id" value="${pagardizimoInstance?.dizimista?.id}"  />
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
