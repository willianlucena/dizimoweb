import br.com.maxinfo.dizimo.Usuario
import br.com.maxinfo.dizimo.Permissao

class UsuarioController {

    def authenticateService

    // the delete, save and update actions only accept POST requests
    static Map allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [usuarioInstanceList: Usuario.list(params), usuarioInstanceTotal: Usuario.count()]
    }

    def show = {
        def usuarioInstance = Usuario.get(params.id)
        if (!usuarioInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
            redirect(action: "list")
            return
        }
        [usuarioInstance: usuarioInstance]
    }

    def delete = {

        def usuarioInstance = Usuario.get(params.id)
        if (usuarioInstance) {
            def authPrincipal = authenticateService.principal()
            // evitar a auto-excluir, se o usuário logado é um administrador
            if (!(authPrincipal instanceof String) && authPrincipal.username == usuarioInstance.username) {
                flash.message = "You can not delete yourself, please login as another admin and try again"
            } else {
                try {
                    // primeiro, elimine essa pessoa da tabela 'permissao_people'
                    Permissao.findAll().each { it.removeFromPeople(usuarioInstance) }
                    usuarioInstance.delete(flush: true)
                    flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
                    redirect(action: "list")
                } catch (org.springframework.dao.DataIntegrityViolationException e) {
                    flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
                    redirect(action: "show", id: params.id)
                }
            }
        } else {
            flash.message = "Usuario not found with id $params.id"
            redirect(action: "list")
        }
    }

    def edit = {

        def usuarioInstance = Usuario.get(params.id)
        if (!usuarioInstance) {
            flash.message = "Usuario not found with id $params.id"
            redirect(action: "list")
            return
        }
        return buildPersonModel(usuarioInstance)
    }

    def update = {

        def usuarioInstance = Usuario.get(params.id)
        if (!usuarioInstance) {
            flash.message = "Usuario not found with id $params.id"
            redirect(action: "list")
            return
        }

        long version = params.version.toLong()
        if (usuarioInstance.version > version) {
            usuarioInstance.errors.rejectValue 'version', "person.optimistic.locking.failure",
				"Another user has updated this Usuario while you were editing."
            render view: 'edit', model: buildPersonModel(usuarioInstance)
            return
        }

        def oldPassword = usuarioInstance.passwd
        usuarioInstance.properties = params
        if (!params.passwd.equals(oldPassword)) {
            usuarioInstance.passwd = authenticateService.encodePassword(params.passwd)
        }
        
        if (!usuarioInstance.hasErrors() && usuarioInstance.save(flush: true)) {
            Permissao.findAll().each { it.removeFromPeople(usuarioInstance) }
            addRoles(usuarioInstance)
            redirect(action: "show", id: usuarioInstance.id)
        }
        else {
            render view: 'edit', model: buildPersonModel(usuarioInstance)
        }
    }

    def create = {
        def usuarioInstance = new Usuario()
        usuarioInstance.properties = params
        return [usuarioInstance: usuarioInstance, authorityList: Permissao.list()]
    }

    def save = {
        params.passwd = authenticateService.encodePassword(params.passwd)
        params.enabled = true
        params.criadaEm = new Date()
        println params
        def usuarioInstance = new Usuario(params)
        if (usuarioInstance.save(flush: true)) {
            addRoles(usuarioInstance)
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])}"
            redirect(action: "show", id: usuarioInstance.id)
        } else {
            render(view: "create", model: [usuarioInstance: usuarioInstance, authorityList: Permissao.list()])
        }
    }

    private void addRoles(usuarioInstance) {
        for (String key in params.keySet()) {
            if (key.contains('ROLE') && 'on' == params.get(key)) {
                Permissao.findByAuthority(key).addToPeople(usuarioInstance)
            }
        }
    }

    private Map buildPersonModel(usuarioInstance) {

        List roles = Permissao.list()
        roles.sort { r1, r2 ->
            r1.authority <=> r2.authority
        }
        Set userRoleNames = []
        for (role in usuarioInstance.authorities) {
            userRoleNames << role.authority
        }
        LinkedHashMap<Permissao, Boolean> roleMap = [:]
        for (role in roles) {
            roleMap[(role)] = userRoleNames.contains(role.authority)
        }

        return [usuarioInstance: usuarioInstance, roleMap: roleMap]
    }
}