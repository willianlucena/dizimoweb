
<%@ page import="br.com.maxinfo.dizimo.Endereco" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'endereco.label', default: 'Endereco')}" />
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
                            <td valign="top" class="name"><g:message code="endereco.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: enderecoInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="endereco.bairro.label" default="Bairro" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: enderecoInstance, field: "bairro")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="endereco.cep.label" default="Cep" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: enderecoInstance, field: "cep")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="endereco.cidade.label" default="Cidade" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: enderecoInstance, field: "cidade")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="endereco.complemento.label" default="Complemento" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: enderecoInstance, field: "complemento")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="endereco.estado.label" default="Estado" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: enderecoInstance, field: "estado")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="endereco.logradouro.label" default="Logradouro" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: enderecoInstance, field: "logradouro")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="endereco.numero.label" default="Numero" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: enderecoInstance, field: "numero")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="endereco.pais.label" default="Pais" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: enderecoInstance, field: "pais")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${enderecoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
