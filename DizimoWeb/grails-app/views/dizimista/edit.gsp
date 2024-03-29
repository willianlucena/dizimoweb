
<%@ page import="br.com.maxinfo.dizimo.Dizimista" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
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

        <title>Edição de Cadastro do Dizimista</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Página Inicial</a></span>
        </div>
        <div class="body">
            <h1>Edição de Cadastro do Dizimista</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${dizimistaInstance}">
            <div class="errors">
                <g:renderErrors bean="${dizimistaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${dizimistaInstance?.id}" />
                <g:hiddenField name="version" value="${dizimistaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                            <!--InicioUsuario-->
                                                        <tr class="prop">
                                <td valign="top" class="name">
                                  <label>Login de Usuário: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'username', 'errors')}">
                                    <g:textField name="username" value="${usuarioInstance?.username}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label>Nome Completo: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'userRealName', 'errors')}">
                                    <g:textField name="userRealName" value="${usuarioInstance?.userRealName}" />
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
                                  <label>Ativo: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'enabled', 'errors')}">
                                    <g:checkBox name="enabled" value="${usuarioInstance?.enabled}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label>Identidade: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'identidade', 'errors')}">
                                    <g:textField name="identidade" value="${usuarioInstance?.identidade}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label>Orgão Expedidor: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'orgaoExpedidor', 'errors')}">
                                    <g:textField name="orgaoExpedidor" value="${usuarioInstance?.orgaoExpedidor}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label>Permissões</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'authorities', 'errors')}">

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label>Email: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${usuarioInstance?.email}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label>Telefone: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'telefone', 'errors')}">
                                    <g:textField name="telefone" value="${usuarioInstance?.telefone}" />
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

                            <!--FIMUsuario-->
<!--InicioEndereco-->
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label>Cep: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'cep', 'errors')}">
                                    <g:textField name="cep" value="${enderecoInstance?.cep}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label>Rua: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'logradouro', 'errors')}">
                                    <g:textField name="logradouro" value="${enderecoInstance?.logradouro}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label>Número: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'numero', 'errors')}">
                                    <g:textField name="numero" value="${enderecoInstance?.numero}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                  <td valign="top" class="name">
                                    <label>Bairro: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'bairro', 'errors')}">
                                    <g:textField name="bairro" value="${enderecoInstance?.bairro}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label>Complemento: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'complemento', 'errors')}">
                                    <g:textField name="complemento" value="${enderecoInstance?.complemento}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label>Cidade: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'cidade', 'errors')}">
                                    <g:textField name="cidade" value="${enderecoInstance?.cidade}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label>Estado: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'estado', 'errors')}">
                                    <g:textField name="estado" value="${enderecoInstance?.estado}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label>País: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'pais', 'errors')}">
                                    <g:textField name="pais" value="${enderecoInstance?.pais}" />
                                </td>
                            </tr>

<!--FimEndereco-->
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label>Doações Realizadas: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dizimistaInstance, field: 'doacoes', 'errors')}">
                                    <g:select name="doacoes" from="${br.com.maxinfo.dizimo.Doacoes.list()}" multiple="yes" optionKey="id" size="5" value="${dizimistaInstance?.doacoes*.id}" />
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
                                  <label>Nome do Conjuge: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dizimistaInstance, field: 'nomeConjuge', 'errors')}">
                                    <input type="text" name="nomeConjuge" value="${dizimistaInstance?.nomeConjuge}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="pagardizimos"><g:message code="dizimista.pagardizimos.label" default="Pagardizimos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dizimistaInstance, field: 'pagardizimos', 'errors')}">
                                    
<ul>
<g:each in="${dizimistaInstance?.pagardizimos?}" var="p">
    <li><g:link controller="pagardizimo" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="pagardizimo" action="create" params="['dizimista.id': dizimistaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'pagardizimo.label', default: 'Pagardizimo')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="Atualizar" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="Deletar" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Tem certeza que deseja excluir?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
