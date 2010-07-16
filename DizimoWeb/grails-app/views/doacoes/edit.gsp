
<%@ page import="br.com.maxinfo.dizimo.Doacoes" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'doacoes.label', default: 'Doacoes')}" />
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
            <g:hasErrors bean="${doacoesInstance}">
            <div class="errors">
                <g:renderErrors bean="${doacoesInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${doacoesInstance?.id}" />
                <g:hiddenField name="version" value="${doacoesInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="valor"><g:message code="doacoes.valor.label" default="Valor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: doacoesInstance, field: 'valor', 'errors')}">
                                    <input type="text" name="valor" value="${doacoesInstance?.valor}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="data"><g:message code="doacoes.data.label" default="Data" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: doacoesInstance, field: 'data', 'errors')}">
                                    <g:datePicker name="data" precision="day" value="${doacoesInstance?.data}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="igreja"><g:message code="doacoes.igreja.label" default="Igreja" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: doacoesInstance, field: 'igreja', 'errors')}">
                                    <g:select name="igreja.id" from="${br.com.maxinfo.dizimo.Igreja.list()}" optionKey="id" value="${doacoesInstance?.igreja?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="descricao"><g:message code="doacoes.descricao.label" default="Descricao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: doacoesInstance, field: 'descricao', 'errors')}">
                                    <input type="text" name="descricao" value="${doacoesInstance?.descricao}" />
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
