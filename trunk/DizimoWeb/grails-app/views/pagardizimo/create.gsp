
<%@ page import="br.com.maxinfo.dizimo.Pagardizimo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <calendar:resources lang="br" theme="tiger"/>
        <g:set var="entityName" value="${message(code: 'pagardizimo.label', default: 'Pagardizimo')}" />
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
            <g:hasErrors bean="${pagardizimoInstance}">
            <div class="errors">
                <g:renderErrors bean="${pagardizimoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataPagamento"><g:message code="pagardizimo.dataPagamento.label" default="Data Pagamento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pagardizimoInstance, field: 'dataPagamento', 'errors')}">
                                    <!--<g:datePicker name="dataPagamento" precision="day" value="${pagardizimoInstance?.dataPagamento}"  />-->
                                    <calendar:datePicker name="dataPagamento" value="${pagardizimoInstance?.dataPagamento}" dateFormat="%d/%m/%Y %H:%M" showTime="false" ></calendar:datePicker>
                                </td>
                            </tr>
                        
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
                                    <!--<input type="text" name="mesReferencia" value="${pagardizimoInstance?.mesReferencia}" />-->
                                    <g:datePicker name="mesReferencia" precision="year" value="${pagardizimoInstance?.mesReferencia}"  />
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
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
