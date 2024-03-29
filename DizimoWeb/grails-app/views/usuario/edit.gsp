
<%@ page import="br.com.maxinfo.dizimo.Usuario" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
  <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
  <div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
  </div>
  <div class="body">
    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${usuarioInstance}">
      <div class="errors">
        <g:renderErrors bean="${usuarioInstance}" as="list" />
      </div>
    </g:hasErrors>
    <g:form method="post" >
      <g:hiddenField name="id" value="${usuarioInstance?.id}" />
      <g:hiddenField name="version" value="${usuarioInstance?.version}" />
      <div class="dialog">
        <table>
          <tbody>

            <tr class="prop">
              <td valign="top" class="name"><label for="userRealName">Nome Completo:</label></td>
              <td valign="top" class="value ${hasErrors(bean:usuarioInstance,field:'userRealName','errors')}">
                <input type="text" id="userRealName" name="userRealName" value="${usuarioInstance.userRealName?.encodeAsHTML()}"/>
              </td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name"><label for="username">Login:</label></td>
              <td valign="top" class="value ${hasErrors(bean:usuarioInstance,field:'username','errors')}">
                <input type="text" id="username" name="username" value="${usuarioInstance.username?.encodeAsHTML()}"/>
              </td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name"><label for="passwd">Senha:</label></td>
              <td valign="top" class="value ${hasErrors(bean:usuarioInstance,field:'passwd','errors')}">
                <input type="password" id="passwd" name="passwd" value="${usuarioInstance.passwd?.encodeAsHTML()}"/>
              </td>
            </tr>


            <tr class="prop">
              <td valign="top" class="name">
                <label for="orgaoExpedidor"><g:message code="usuario.orgaoExpedidor.label" default="Orgao Expedidor" /></label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'orgaoExpedidor', 'errors')}">
                <input type="text" name="orgaoExpedidor" value="${usuarioInstance?.orgaoExpedidor}" />
              </td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="email"><g:message code="usuario.email.label" default="Email" /></label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'email', 'errors')}">
                <input type="text" name="email" value="${usuarioInstance?.email}" />
              </td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="telefone"><g:message code="usuario.telefone.label" default="Telefone" /></label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'telefone', 'errors')}">
                <input type="text" name="telefone" value="${usuarioInstance?.telefone}" />
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
            <td valign="top" class="name">
              <label for="identidade"><g:message code="usuario.identidade.label" default="Identidade" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'identidade', 'errors')}">
              <input type="text" name="identidade" value="${usuarioInstance?.identidade}" />
            </td>
          </tr>
          
          <tr class="prop">
              <td valign="top" class="name"><label for="authorities">Permissões:</label></td>
              <td valign="top" class="value ${hasErrors(bean:person,field:'authorities','errors')}">
                  <ul>
                      <g:each var="entry" in="${roleMap}">
                          <li>${entry.key.authority.encodeAsHTML()}
                              <g:checkBox name="${entry.key.authority}" value="${entry.value}"/>
                          </li>
                      </g:each>
                  </ul>
              </td>
              </tr>

          </tbody>
        </table>
      </div>
      <div class="buttons">
        <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
        <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
      </div>
    </g:form>
  </div>
</body>
</html>
