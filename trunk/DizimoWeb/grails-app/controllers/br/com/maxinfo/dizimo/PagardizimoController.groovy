package br.com.maxinfo.dizimo

class PagardizimoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [pagardizimoInstanceList: Pagardizimo.list(params), pagardizimoInstanceTotal: Pagardizimo.count()]
    }

    def create = {
        def pagardizimoInstance = new Pagardizimo()
        pagardizimoInstance.properties = params
        return [pagardizimoInstance: pagardizimoInstance]
    }

    def save = {
        def pagardizimoInstance = new Pagardizimo(params)
        if (pagardizimoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'pagardizimo.label', default: 'Pagardizimo'), pagardizimoInstance.id])}"
            redirect(action: "show", id: pagardizimoInstance.id)
        }
        else {
            render(view: "create", model: [pagardizimoInstance: pagardizimoInstance])
        }
    }

    def show = {
        def pagardizimoInstance = Pagardizimo.get(params.id)
        if (!pagardizimoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pagardizimo.label', default: 'Pagardizimo'), params.id])}"
            redirect(action: "list")
        }
        else {
            [pagardizimoInstance: pagardizimoInstance]
        }
    }

    def edit = {
        def pagardizimoInstance = Pagardizimo.get(params.id)
        if (!pagardizimoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pagardizimo.label', default: 'Pagardizimo'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [pagardizimoInstance: pagardizimoInstance]
        }
    }

    def update = {
        def pagardizimoInstance = Pagardizimo.get(params.id)
        if (pagardizimoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (pagardizimoInstance.version > version) {
                    
                    pagardizimoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'pagardizimo.label', default: 'Pagardizimo')] as Object[], "Another user has updated this Pagardizimo while you were editing")
                    render(view: "edit", model: [pagardizimoInstance: pagardizimoInstance])
                    return
                }
            }
            pagardizimoInstance.properties = params
            if (!pagardizimoInstance.hasErrors() && pagardizimoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'pagardizimo.label', default: 'Pagardizimo'), pagardizimoInstance.id])}"
                redirect(action: "show", id: pagardizimoInstance.id)
            }
            else {
                render(view: "edit", model: [pagardizimoInstance: pagardizimoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pagardizimo.label', default: 'Pagardizimo'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def pagardizimoInstance = Pagardizimo.get(params.id)
        if (pagardizimoInstance) {
            try {
                pagardizimoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'pagardizimo.label', default: 'Pagardizimo'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'pagardizimo.label', default: 'Pagardizimo'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pagardizimo.label', default: 'Pagardizimo'), params.id])}"
            redirect(action: "list")
        }
    }
}
