
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
                               <!-- <td valign="top" class="name">
                                    <label for="usuario"><g:message code="dizimista.usuario.label" default="Usuario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dizimistaInstance, field: 'usuario', 'errors')}">
                                    <g:select name="usuario.id" from="${Usuario.list()}" optionKey="id" value="${dizimistaInstance?.usuario?.id}"  />
                                </td>-->
                                <!--INICIO Usuário LABEL-->
                                <td valign="top" class="name">
                                    <label for="username"><g:message code="usuario.username.label" default="Username" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'username', 'errors')}">
                                    <g:textField name="username" value="${usuarioInstance?.username}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="userRealName"><g:message code="usuario.userRealName.label" default="User Real Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'userRealName', 'errors')}">
                                    <g:textField name="userRealName" value="${usuarioInstance?.userRealName}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="passwd"><g:message code="usuario.passwd.label" default="Passwd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'passwd', 'errors')}">
                                    <g:textField name="passwd" value="${usuarioInstance?.passwd}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="enabled"><g:message code="usuario.enabled.label" default="Enabled" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'enabled', 'errors')}">
                                    <g:checkBox name="enabled" value="${usuarioInstance?.enabled}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="orgaoExpedidor"><g:message code="usuario.orgaoExpedidor.label" default="Orgao Expedidor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'orgaoExpedidor', 'errors')}">
                                    <g:textField name="orgaoExpedidor" value="${usuarioInstance?.orgaoExpedidor}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="criadaEm"><g:message code="usuario.criadaEm.label" default="Criada Em" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'criadaEm', 'errors')}">
                                    <g:datePicker name="criadaEm" precision="day" value="${usuarioInstance?.criadaEm}"  />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="emailShow"><g:message code="usuario.emailShow.label" default="Email Show" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'emailShow', 'errors')}">
                                    <g:checkBox name="emailShow" value="${usuarioInstance?.emailShow}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="usuario.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${usuarioInstance?.email}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="usuario.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${usuarioInstance?.description}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="telefone"><g:message code="usuario.telefone.label" default="Telefone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'telefone', 'errors')}">
                                    <g:textField name="telefone" value="${usuarioInstance?.telefone}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataNascimento"><g:message code="usuario.dataNascimento.label" default="Data Nascimento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'dataNascimento', 'errors')}">
                                    <g:datePicker name="dataNascimento" precision="day" value="${usuarioInstance?.dataNascimento}"  />
                                </td>
                            </tr>

                            <tr class="prop">
                                <!--<td valign="top" class="name">
                                    <label for="endereco"><g:message code="usuario.endereco.label" default="Endereco" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'endereco', 'errors')}">
                                    <g:select name="endereco.id" from="${br.com.maxinfo.dizimo.Endereco.list()}" optionKey="id" value="${usuarioInstance?.endereco?.id}"  />
                                </td>-->

                                <!--INICIO Usuário LABEL-->
                                <td valign="top" class="name">
                                    <label for="codCidade"><g:message code="endereco.codCidade.label" default="Cod Cidade" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'codCidade', 'errors')}">
                                    <g:textField name="codCidade" value="${enderecoInstance?.codCidade}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="complemento"><g:message code="endereco.complemento.label" default="Complemento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'complemento', 'errors')}">
                                    <g:textField name="complemento" value="${enderecoInstance?.complemento}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pais"><g:message code="endereco.pais.label" default="Pais" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'pais', 'errors')}">
                                    <g:textField name="pais" value="${enderecoInstance?.pais}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="numero"><g:message code="endereco.numero.label" default="Numero" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'numero', 'errors')}">
                                    <g:textField name="numero" value="${enderecoInstance?.numero}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bairro"><g:message code="endereco.bairro.label" default="Bairro" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'bairro', 'errors')}">
                                    <g:textField name="bairro" value="${enderecoInstance?.bairro}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cidade"><g:message code="endereco.cidade.label" default="Cidade" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'cidade', 'errors')}">
                                    <g:textField name="cidade" value="${enderecoInstance?.cidade}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cep"><g:message code="endereco.cep.label" default="Cep" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'cep', 'errors')}">
                                    <g:textField name="cep" value="${enderecoInstance?.cep}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="estado"><g:message code="endereco.estado.label" default="Estado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'estado', 'errors')}">
                                    <g:textField name="estado" value="${enderecoInstance?.estado}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="codPais"><g:message code="endereco.codPais.label" default="Cod Pais" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'codPais', 'errors')}">
                                    <g:textField name="codPais" value="${enderecoInstance?.codPais}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="logradouro"><g:message code="endereco.logradouro.label" default="Logradouro" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'logradouro', 'errors')}">
                                    <g:textField name="logradouro" value="${enderecoInstance?.logradouro}" />
                                </td>
                                
                            </tr>
<!--FIM Endereço LABEL-->
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="identidade"><g:message code="usuario.identidade.label" default="Identidade" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'identidade', 'errors')}">
                                    <g:textField name="identidade" value="${usuarioInstance?.identidade}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pass"><g:message code="usuario.pass.label" default="Pass" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'pass', 'errors')}">
                                    <g:textField name="pass" value="${usuarioInstance?.pass}" />
                                </td>
                         
                                </tr>
                       
                              <!--FIM Usuario LABEL-->
                        <!--Inicio Dizimista Label-->
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
                        <!--FIM Dizimista Label-->
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
