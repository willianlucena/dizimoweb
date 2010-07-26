<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'main2.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
      <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="Spinner" />
        </div>
        <div id="grailsLogo" class="logo"><a href="http://grails.org"><img src="${resource(dir:'images',file:'grails_logo.png')}" alt="Grails" border="0" /></a></div>
		<div id="nav">
			<div class="homePagePanel">
				<div class="panelTop">

				</div>
				<div class="panelBody">
                                  <h1>Menu Principal</h1>
                                  <ul>

                                        <li class="controller"><g:link controller="dizimista">Administrar Dizimistas</g:link></li>
                                        <li class="controller"><g:link controller="igreja">Administrar Igrejas</g:link></li>
                                        <li class="controller"><g:link controller="login">Login</g:link></li>
                                        <li class="controller"><g:link controller="logout">Sair</g:link></li>
                                  </ul>
                                        <h1>Menu Financeiro</h1>
                                        <ul>
                                        <li class="controller"><g:link controller="pagardizimo">Receber Pagamento</g:link></li>
                                        <li class="controller"><g:link controller="doacoes">Receber Doações</g:link></li>
                                        </ul>
                                        <h1>Menu Administrativo</h1>
                                        <ul>
                                        <li class="controller"><g:link controller="mapeamento">Administrar Mapeamentos</g:link></li>
                                        <li class="controller"><g:link controller="permissao">Administrar Permissões</g:link></li>
                                        <li class="controller"><g:link controller="usuario">Administrar Usuários</g:link></li>
                                        <li class="controller"><g:link controller="endereco">Administrar Endereços</g:link></li>
                                  </ul>
				</div>
				<div class="panelBtm">
				</div>
			</div>


		</div>
		<div id="pageBody">
                    <g:layoutBody />
		</div>

    </body>
</html>