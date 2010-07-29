
<%@ page import="br.com.maxinfo.dizimo.Doacoes"%>
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

		<title>Doacao</title>
		
		    <script type="text/javascript">
			$(document).ready(function(){
		
      			$("#igreja").autocomplete(
    				    "${resource(dir:'')}/igreja/igrejaAjax"
    				    ,{ 
    						  dataType:"json"
    						, minChars:2
    					    , formatItem: function(data,i,max,value,term){
    					        return value;
    					    }
    					    , parse: function(data){
    					        var ig = new Array();
    					        for(var i=0;i<data.length;i++){
    					        	ig[ig.length] = { data:data[i], value:data[i].nome, result:data[i].nome};
    								
    						    }
    					        return ig;
    					     }
    				    }).result(function(e,data){
    						$("#igrejaId").val(data.id);
    					});
    	  	});

	        $(function(){
	  			$(".money").priceFormat({
		  		    prefix: 'R$ ',
		  		    centsSeparator: ',',
		  		    thousandsSeparator: '.'
		  		});
	        });

    	</script>
	</head>
	<body>
		<div class="nav">
			<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label" /></a></span>
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
			<g:form action="save" method="post">
				<div class="dialog">
					<table>
						<tbody>
				
							<tr class="prop">
								<td valign="top" class="name"><label for="valor"><g:message code="doacoes.valor.label" default="Valor" /></label></td>
								<td valign="top" class="value ${hasErrors(bean: doacoesInstance, field: 'valor', 'errors')}">
									<input class="money" name="valor" value="${doacoesInstance?.valor}" />
								</td>
							</tr>
								
							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="igreja"><g:message code="doacoesInstance.igreja.label" default="Igreja" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: doacoesInstance, field: 'igreja', 'errors')}">
									<input type="text" name="igreja" id="igreja" />
		                        	<input type="hidden" name="igrejaId" id="igrejaId" />
                                </td>
                            </tr>
				
								<tr class="prop">
									<td valign="top" class="name"><label for="descricao"><g:message
										code="doacoes.descricao.label" default="Descricao" /></label></td>
									<td valign="top"
										class="value ${hasErrors(bean: doacoesInstance, field: 'descricao', 'errors')}">
									<input type="text" name="descricao"
										value="${doacoesInstance?.descricao}" /></td>
								</tr>
						</tbody>
					</table>
	</div>
	<div class="buttons"><span class="button"><g:submitButton
		name="create" class="save"
		value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
	</div>
</g:form></div>
</body>
</html>
