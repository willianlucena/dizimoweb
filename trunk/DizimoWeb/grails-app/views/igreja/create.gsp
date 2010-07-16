
<%@ page import="br.com.maxinfo.dizimo.Igreja" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'igreja.label', default: 'Igreja')}" />
  <title>Nova Igreja</title>
</head>
<body>
  <div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
    <span class="menuButton"><g:link class="list" action="list">Listar Igrejas</g:link></span>
  </div>
  <div class="body">
    <h1>Nova Igreja</h1>
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${igrejaInstance}">
      <div class="errors">
        <g:renderErrors bean="${igrejaInstance}" as="list" />
      </div>
    </g:hasErrors>
    <g:form action="save" method="post" >
      <div class="dialog">
        <table>
          <tbody>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="coordenador"><g:message code="igreja.coordenador.label" default="Coordenador" /></label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: igrejaInstance, field: 'coordenador', 'errors')}">
          <g:textField name="coordenador" value="${igrejaInstance?.coordenador}" />
          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="nome"><g:message code="igreja.nome.label" default="Nome da Igreja" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: igrejaInstance, field: 'nome', 'errors')}">
          <g:textField name="nome" value="${igrejaInstance?.nome}" />
          </td>
          </tr>

          <tr class="prop">
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

          </tbody>
        </table>
      </div>
      <div class="buttons">
        <span class="button"><g:submitButton name="create" class="save" value="Criar" /></span>
      </div>
    </g:form>
  </div>
</body>
</html>
