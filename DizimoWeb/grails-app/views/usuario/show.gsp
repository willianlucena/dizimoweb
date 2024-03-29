
<%@ page import="br.com.maxinfo.dizimo.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
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
                            <td valign="top" class="name"><g:message code="usuario.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.username.label" default="Login" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "username")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.userRealName.label" default="Nome Completo" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "userRealName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.enabled.label" default="Ativo" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${usuarioInstance?.enabled}" true="Sim" false="Não"/></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.orgaoExpedidor.label" default="Orgao Expedidor" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "orgaoExpedidor")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.criadaEm.label" default="Data de criação" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${usuarioInstance?.criadaEm}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.authorities.label" default="Permissões" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${usuarioInstance.authorities}" var="a">
                                    <li><g:link controller="permissao" action="show" id="${a.id}">${a?.authority?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.email.label" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "email")}</td>
                            
                        </tr>
                     
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.telefone.label" default="Telefone" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "telefone")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.dataNascimento.label" default="Data de Nascimento" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${usuarioInstance?.dataNascimento}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.identidade.label" default="Identidade" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "identidade")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${usuarioInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
