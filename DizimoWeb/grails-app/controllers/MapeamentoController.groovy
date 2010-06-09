class MapeamentoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [mapeamentoInstanceList: Mapeamento.list(params), mapeamentoInstanceTotal: Mapeamento.count()]
    }

    def create = {
        def mapeamentoInstance = new Mapeamento()
        mapeamentoInstance.properties = params
        return [mapeamentoInstance: mapeamentoInstance]
    }

    def save = {
        def mapeamentoInstance = new Mapeamento(params)
        if (mapeamentoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'mapeamento.label', default: 'Mapeamento'), mapeamentoInstance.id])}"
            redirect(action: "show", id: mapeamentoInstance.id)
        }
        else {
            render(view: "create", model: [mapeamentoInstance: mapeamentoInstance])
        }
    }

    def show = {
        def mapeamentoInstance = Mapeamento.get(params.id)
        if (!mapeamentoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mapeamento.label', default: 'Mapeamento'), params.id])}"
            redirect(action: "list")
        }
        else {
            [mapeamentoInstance: mapeamentoInstance]
        }
    }

    def edit = {
        def mapeamentoInstance = Mapeamento.get(params.id)
        if (!mapeamentoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mapeamento.label', default: 'Mapeamento'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [mapeamentoInstance: mapeamentoInstance]
        }
    }

    def update = {
        def mapeamentoInstance = Mapeamento.get(params.id)
        if (mapeamentoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (mapeamentoInstance.version > version) {
                    
                    mapeamentoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'mapeamento.label', default: 'Mapeamento')] as Object[], "Another user has updated this Mapeamento while you were editing")
                    render(view: "edit", model: [mapeamentoInstance: mapeamentoInstance])
                    return
                }
            }
            mapeamentoInstance.properties = params
            if (!mapeamentoInstance.hasErrors() && mapeamentoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'mapeamento.label', default: 'Mapeamento'), mapeamentoInstance.id])}"
                redirect(action: "show", id: mapeamentoInstance.id)
            }
            else {
                render(view: "edit", model: [mapeamentoInstance: mapeamentoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mapeamento.label', default: 'Mapeamento'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def mapeamentoInstance = Mapeamento.get(params.id)
        if (mapeamentoInstance) {
            try {
                mapeamentoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'mapeamento.label', default: 'Mapeamento'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'mapeamento.label', default: 'Mapeamento'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mapeamento.label', default: 'Mapeamento'), params.id])}"
            redirect(action: "list")
        }
    }
}
