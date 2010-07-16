
<%@ page import="br.com.maxinfo.dizimo.Dizimista" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dizimista.label', default: 'Dizimista')}" />
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
            <g:hasErrors bean="${dizimistaInstance}">
            <div class="errors">
                <g:renderErrors bean="${dizimistaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
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
                                    <input type="text" name="nomeConjuge" value="${dizimistaInstance?.nomeConjuge}" />
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
