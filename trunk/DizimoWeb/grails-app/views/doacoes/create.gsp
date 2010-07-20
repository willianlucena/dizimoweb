
<%@ page import="br.com.maxinfo.dizimo.Doacoes" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    
    <script src="jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="jquery-ui-1.8.2.custom.min.js" type="text/javascript"></script>
    <!--<script src="jquery.ui.datepicker-pt-BR.js" type="text/javascript"></script>-->

          <script type="text/javascript">
              (function() {
                  $("#datepicker").datepicker();
              });
          </script>

  
    <title>Doacao</title>
</head>
<body>
  <div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
  </div>
  <div class="body">
    <h1>Inserir doacao</h1>
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${doacoesInstance}">
      <div class="errors">
        <g:renderErrors bean="${doacoesInstance}" as="list" />
      </div>
    </g:hasErrors>
    <g:form action="save" method="post" >
      <div class="dialog">
        <table>
          <tbody>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="valor"><g:message code="doacoes.valor.label" default="Valor" /></label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: doacoesInstance, field: 'valor', 'errors')}">
          <input type="text" name="valor" value="${doacoesInstance?.valor}" />
          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="data"><g:message code="doacoes.data.label" default="Data" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: doacoesInstance, field: 'data', 'errors')}">
              <input type="text" name="data" id="datepicker" onfocus="" value="${doacoesInstance?.data}">
            </td>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="igreja"><g:message code="doacoes.igreja.label" default="Igreja" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: doacoesInstance, field: 'igreja', 'errors')}">
          <g:select name="igreja.id" from="${br.com.maxinfo.dizimo.Igreja.list()}" optionKey="id" value="${doacoesInstance?.igreja?.id}"  />
          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="descricao"><g:message code="doacoes.descricao.label" default="Descricao" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: doacoesInstance, field: 'descricao', 'errors')}">
          <input type="text" name="descricao" value="${doacoesInstance?.descricao}" />
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