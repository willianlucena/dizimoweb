package br.com.maxinfo.dizimo

class DoacoesController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [doacoesInstanceList: Doacoes.list(params), doacoesInstanceTotal: Doacoes.count()]
    }

    def create = {
        def doacoesInstance = new Doacoes()
        doacoesInstance.properties = params
        return [doacoesInstance: doacoesInstance]
    }

    def save = {
        def doacoesInstance = new Doacoes(params)
        if (doacoesInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'doacoes.label', default: 'Doacoes'), doacoesInstance.id])}"
            redirect(action: "show", id: doacoesInstance.id)
        }
        else {
            render(view: "create", model: [doacoesInstance: doacoesInstance])
        }
    }

    def show = {
        def doacoesInstance = Doacoes.get(params.id)
        if (!doacoesInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'doacoes.label', default: 'Doacoes'), params.id])}"
            redirect(action: "list")
        }
        else {
            [doacoesInstance: doacoesInstance]
        }
    }

    def edit = {
        def doacoesInstance = Doacoes.get(params.id)
        if (!doacoesInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'doacoes.label', default: 'Doacoes'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [doacoesInstance: doacoesInstance]
        }
    }

    def update = {
        def doacoesInstance = Doacoes.get(params.id)
        if (doacoesInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (doacoesInstance.version > version) {
                    
                    doacoesInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'doacoes.label', default: 'Doacoes')] as Object[], "Another user has updated this Doacoes while you were editing")
                    render(view: "edit", model: [doacoesInstance: doacoesInstance])
                    return
                }
            }
            doacoesInstance.properties = params
            if (!doacoesInstance.hasErrors() && doacoesInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'doacoes.label', default: 'Doacoes'), doacoesInstance.id])}"
                redirect(action: "show", id: doacoesInstance.id)
            }
            else {
                render(view: "edit", model: [doacoesInstance: doacoesInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'doacoes.label', default: 'Doacoes'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def doacoesInstance = Doacoes.get(params.id)
        if (doacoesInstance) {
            try {
                doacoesInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'doacoes.label', default: 'Doacoes'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'doacoes.label', default: 'Doacoes'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'doacoes.label', default: 'Doacoes'), params.id])}"
            redirect(action: "list")
        }
    }
}
