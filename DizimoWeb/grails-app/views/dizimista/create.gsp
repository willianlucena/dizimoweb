
<%@ page import="br.com.maxinfo.dizimo.Dizimista" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Cadastrar Dizimista</title>
        <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'css',file:'jquery.autocomplete.css')}"></link>
        <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'css',file:'jquery-ui-1.8.custom.css')}"></link>
        
        <script type="text/javascript" src="${createLinkTo(dir:'js/jquery',file:'jquery-1.4.2.js')}" ></script>
        <script type="text/javascript" src="${createLinkTo(dir:'js/jquery',file:'jquery-ui.js')}" ></script>
        <script type="text/javascript" src="${createLinkTo(dir:'js/jquery',file:'jquery.bgiframe.min.js')}" ></script>
        <script type="text/javascript" src="${createLinkTo(dir:'js/jquery',file:'jquery.autocomplete.js')}" ></script>
        <script type="text/javascript" src="${createLinkTo(dir:'js/jquery',file:'jquery.price_format.1.3.js')}" ></script>
        
       
         <script type="text/javascript">

         	$(function() {
	    		$(".data").datepicker(
	    				{changeMonth:true, changeYear:true}
	    	    );
	    	});

    	</script>

    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Página Inicial</a></span>
            <span class="menuButton"><g:link class="list" action="list">Listar Dizimistas</g:link></span>
        </div>
        <div class="body">
            <h1>Cadastrar Dizimista</h1>
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

                                <!--INICIO Usuário LABEL-->
                                <td valign="top" class="name">
                                    <label>Login de Usuário: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'username', 'errors')}">
                                    <input type="text" name="username" value="${usuarioInstance?.username}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label>Nome Completo: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'userRealName', 'errors')}">
                                    <input type="text" name="userRealName" value="${usuarioInstance?.userRealName}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label>Senha: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'passwd', 'errors')}">
                                    <input type="password" name="passwd" value="${usuarioInstance?.passwd}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label>Identidade: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'identidade', 'errors')}">
                                    <input type="text" name="identidade" value="${usuarioInstance?.identidade}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label>Orgão Expedidor: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'orgaoExpedidor', 'errors')}">
                                    <input type="text" name="orgaoExpedidor" value="${usuarioInstance?.orgaoExpedidor}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label>Email: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'email', 'errors')}">
                                    <input type="text" name="email" value="${usuarioInstance?.email}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label>Telefone: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'telefone', 'errors')}">
                                    <input type="text" name="telefone" value="${usuarioInstance?.telefone}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label>Data Nascimento: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'dataNascimento', 'errors')}">
                                    <input readonly="readonly" class="data" name="dataNascimento" value="${usuarioInstance?.dataNascimento}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label>Cep: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'cep', 'errors')}">
                                    <input type="text" name="cep" value="${enderecoInstance?.cep}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label>Rua: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'logradouro', 'errors')}">
                                    <input type="text" name="logradouro" value="${enderecoInstance?.logradouro}" />
                                </td>

                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label>Número: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'numero', 'errors')}">
                                    <input type="text" name="numero" value="${enderecoInstance?.numero}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label>Bairro:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'bairro', 'errors')}">
                                    <input type="text" name="bairro" value="${enderecoInstance?.bairro}" />
                                </td>
                            </tr>


                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label>Complemento: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'complemento', 'errors')}">
                                    <input type="text" name="complemento" value="${enderecoInstance?.complemento}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label>Cidade: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'cidade', 'errors')}">
                                    <input type="text" name="cidade" value="${enderecoInstance?.cidade}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label>Estado: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'estado', 'errors')}">
                                    <input type="text" name="estado" value="${enderecoInstance?.estado}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label>País: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'pais', 'errors')}">
                                    <input type="text" name="pais" value="${enderecoInstance?.pais}" />
                                </td>
                            </tr>


<!--FIM Endereço LABEL-->

                              <!--FIM Usuario LABEL-->
                        <!--Inicio Dizimista Label-->
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label>Se for casado. . .</label>
                                </td>
                                <td valign="top" class="value">
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataCasamento"><g:message code="dizimista.dataCasamento.label" default="Data Casamento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dizimistaInstance, field: 'dataCasamento', 'errors')}">
                                    <input readonly="readonly" class="data" name="dataCasamento" value="${dizimistaInstance?.dataCasamento}" />
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
                        
                        <!--FIM Dizimista Label-->
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="Cadastrar" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
