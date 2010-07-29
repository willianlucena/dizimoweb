<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'main2.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <script type="text/javascript" src="${createLinkTo(dir:'js/jquery',file:'jquery-1.4.1.js')}" ></script>
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
      <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="Spinner" />
        </div>
        <div id="grailsLogo" class="logo" align="middle"><a class="home" href="${createLink(uri: '/')}"><img src="${resource(dir:'images',file:'dizimo.png')}" alt="Sistema de Gerenciamento do Dizimo" border="0" /></a></div>
		<div id="naveg">
			<div class="homePagePanel">

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
                                        <li class="controller"><g:link controller="pagardizimo" action="create">Receber Pagamento</g:link></li>
                                        <li class="controller"><g:link controller="doacoes" action="create">Receber Doações</g:link></li>
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