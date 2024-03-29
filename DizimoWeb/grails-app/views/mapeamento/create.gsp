
<%@ page import="br.com.maxinfo.dizimo.Mapeamento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'mapeamento.label', default: 'Mapeamento')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${mapeamentoInstance}">
            <div class="errors">
                <g:renderErrors bean="${mapeamentoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="url"><g:message code="mapeamento.url.label" default="Url" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mapeamentoInstance, field: 'url', 'errors')}">
                                    <input type="text" name="url" value="${mapeamentoInstance?.url}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="configAttribute"><g:message code="mapeamento.configAttribute.label" default="Config Attribute" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mapeamentoInstance, field: 'configAttribute', 'errors')}">
                                    <input type="text" name="configAttribute" value="${mapeamentoInstance?.configAttribute}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
