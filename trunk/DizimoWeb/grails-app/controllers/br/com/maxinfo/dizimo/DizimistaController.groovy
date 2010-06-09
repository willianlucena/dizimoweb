package br.com.maxinfo.dizimo

class DizimistaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [dizimistaInstanceList: Dizimista.list(params), dizimistaInstanceTotal: Dizimista.count()]
    }

    def create = {
        def dizimistaInstance = new Dizimista()
        dizimistaInstance.properties = params
        return [dizimistaInstance: dizimistaInstance]
    }

    def save = {
        def dizimistaInstance = new Dizimista(params)
        if (dizimistaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'dizimista.label', default: 'Dizimista'), dizimistaInstance.id])}"
            redirect(action: "show", id: dizimistaInstance.id)
        }
        else {
            render(view: "create", model: [dizimistaInstance: dizimistaInstance])
        }
    }

    def show = {
        def dizimistaInstance = Dizimista.get(params.id)
        if (!dizimistaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dizimista.label', default: 'Dizimista'), params.id])}"
            redirect(action: "list")
        }
        else {
            [dizimistaInstance: dizimistaInstance]
        }
    }

    def edit = {
        def dizimistaInstance = Dizimista.get(params.id)
        if (!dizimistaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dizimista.label', default: 'Dizimista'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [dizimistaInstance: dizimistaInstance]
        }
    }

    def update = {
        def dizimistaInstance = Dizimista.get(params.id)
        if (dizimistaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (dizimistaInstance.version > version) {
                    
                    dizimistaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'dizimista.label', default: 'Dizimista')] as Object[], "Another user has updated this Dizimista while you were editing")
                    render(view: "edit", model: [dizimistaInstance: dizimistaInstance])
                    return
                }
            }
            dizimistaInstance.properties = params
            if (!dizimistaInstance.hasErrors() && dizimistaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'dizimista.label', default: 'Dizimista'), dizimistaInstance.id])}"
                redirect(action: "show", id: dizimistaInstance.id)
            }
            else {
                render(view: "edit", model: [dizimistaInstance: dizimistaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dizimista.label', default: 'Dizimista'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def dizimistaInstance = Dizimista.get(params.id)
        if (dizimistaInstance) {
            try {
                dizimistaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'dizimista.label', default: 'Dizimista'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'dizimista.label', default: 'Dizimista'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dizimista.label', default: 'Dizimista'), params.id])}"
            redirect(action: "list")
        }
    }
}
