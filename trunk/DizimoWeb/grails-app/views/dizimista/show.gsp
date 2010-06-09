
<%@ page import="br.com.maxinfo.dizimo.Dizimista" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dizimista.label', default: 'Dizimista')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dizimista.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dizimistaInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dizimista.usuario.label" default="Usuario" /></td>
                            
                            <td valign="top" class="value"><g:link controller="usuario" action="show" id="${dizimistaInstance?.usuario?.id}">${dizimistaInstance?.usuario?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dizimista.doacoes.label" default="Doacoes" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${dizimistaInstance.doacoes}" var="d">
                                    <li><g:link controller="doacoes" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dizimista.dataCasamento.label" default="Data Casamento" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${dizimistaInstance?.dataCasamento}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dizimista.dataPrimeiroPagamento.label" default="Data Primeiro Pagamento" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${dizimistaInstance?.dataPrimeiroPagamento}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dizimista.nomeConjuge.label" default="Nome Conjuge" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dizimistaInstance, field: "nomeConjuge")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dizimista.dataAfastamento.label" default="Data Afastamento" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${dizimistaInstance?.dataAfastamento}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dizimista.pagardizimos.label" default="Pagardizimos" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${dizimistaInstance.pagardizimos}" var="p">
                                    <li><g:link controller="pagardizimo" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${dizimistaInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
