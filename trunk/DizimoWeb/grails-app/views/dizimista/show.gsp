
<%@ page import="br.com.maxinfo.dizimo.Endereco" %>
<%@ page import="br.com.maxinfo.dizimo.Usuario" %>
<%@ page import="br.com.maxinfo.dizimo.Dizimista" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Detalhes do Dizimista</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Página Inicial</a></span>
            <span class="menuButton"><g:link class="list" action="list">Listar Dizimistas</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">Cadastrar Dizimista</g:link></span>
        </div>
        <div class="body">
              <h1>Detalhes do Dizimista</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                        <tr class="prop">
                            <td valign="top" class="name">Código: </td>

                            <td valign="top" class="value">${fieldValue(bean: dizimistaInstance, field: "id")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Dizimista: </td>

                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "userRealName")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Login de Usuário: </td>

                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "username")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Ativo: </td>

                            <td valign="top" class="value"><g:formatBoolean boolean="${usuarioInstance?.enabled}" /></td>

                        </tr>

                       <tr class="prop">
                            <td valign="top" class="name">Identidade: </td>

                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "identidade")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Orgão Expedidor: </td>

                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "orgaoExpedidor")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Email: </td>

                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "email")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Telefone: </td>

                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "telefone")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Data de Nascimento: </td>

                            <td valign="top" class="value"><g:formatDate date="${usuarioInstance?.dataNascimento}" /></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Cep: </td>

                            <td valign="top" class="value">${fieldValue(bean: enderecoInstance, field: "cep")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Rua: </td>

                            <td valign="top" class="value">${fieldValue(bean: enderecoInstance, field: "logradouro")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Número: </td>

                            <td valign="top" class="value">${fieldValue(bean: enderecoInstance, field: "numero")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Bairro: </td>

                            <td valign="top" class="value">${fieldValue(bean: enderecoInstance, field: "bairro")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Complemento: </td>
                            
                            <td valign="top" class="value">${fieldValue(bean: enderecoInstance, field: "complemento")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Cidade: </td>

                            <td valign="top" class="value">${fieldValue(bean: enderecoInstance, field: "cidade")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Estado: </td>

                            <td valign="top" class="value">${fieldValue(bean: enderecoInstance, field: "estado")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="endereco.pais.label" default="Pais" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: enderecoInstance, field: "pais")}</td>
                            
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
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="Editar" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="Deletar" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Tem certeza que deseja excluir?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
