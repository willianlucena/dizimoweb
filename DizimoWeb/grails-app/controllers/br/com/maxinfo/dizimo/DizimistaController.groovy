package br.com.maxinfo.dizimo

import br.com.maxinfo.dizimo.Usuario
import br.com.maxinfo.dizimo.Endereco

class DizimistaController {
	
	def authenticateService
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
        def usuarioInstance = new Usuario()
        def enderecoInstance = new Endereco()
        dizimistaInstance.properties = params
        return [dizimistaInstance: dizimistaInstance, enderecoInstance:enderecoInstance, usuarioInstance: usuarioInstance]
    }

    def save = {
        def enderecoInstance = new Endereco(params)
        println "endereço: " + enderecoInstance.save(flush: true)
        enderecoInstance.errors.each{
            println it
        }
        params.criadaEm = new Date()
		params.passwd = authenticateService.encodePassword(params.passwd)
		//TODO: implementar o relacionamento de igreja e user.
        def usuarioInstance = new Usuario(params)
        println "usuario: " + usuarioInstance.save(flush: true)
        usuarioInstance.errors.each{
            println it
        }
        params.endereco = enderecoInstance
        params.usuario = usuarioInstance
        def dizimistaInstance = new Dizimista(params)
        println(params)
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
        def enderecoInstance = Endereco.get(dizimistaInstance.endereco.id)
        def usuarioInstance = Usuario.get(dizimistaInstance.usuario.id)
        
        if (!dizimistaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dizimista.label', default: 'Dizimista'), params.id])}"
            redirect(action: "list")
        }
        else {
            [dizimistaInstance: dizimistaInstance, enderecoInstance: enderecoInstance, usuarioInstance: usuarioInstance]
        }
    }

    def edit = {
        def dizimistaInstance = Dizimista.get(params.id)
        def enderecoInstance = Endereco.get(dizimistaInstance.endereco.id)
        def usuarioInstance = Usuario.get(dizimistaInstance.usuario.id)
        if (!dizimistaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dizimista.label', default: 'Dizimista'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [dizimistaInstance: dizimistaInstance, enderecoInstance: enderecoInstance, usuarioInstance: usuarioInstance]
        }
    }

    def update = {
        def enderecoInstance = Endereco.get(params.id)
        def usuarioInstance = Usuario.get(params.id)
        def dizimistaInstance = Dizimista.get(params.id)
        if (dizimistaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (dizimistaInstance.version > version) {
                    
                    dizimistaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'dizimista.label', default: 'Dizimista')] as Object[], "Outro Usário está atualizando enqunto ")
                    render(view: "edit", model: [dizimistaInstance: dizimistaInstance, enderecoInstance: enderecoInstance, usuarioInstance: usuarioInstance])
                    return
                }
            }
            dizimistaInstance.properties = params
            enderecoInstance.properties = params
            usuarioInstance.properties = params
            if (!dizimistaInstance.hasErrors() && dizimistaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'dizimista.label', default: 'Dizimista'), dizimistaInstance.id])}"
                redirect(action: "show", id: dizimistaInstance.id)
            }
            else {
                render(view: "edit", model: [dizimistaInstance: dizimistaInstance, , enderecoInstance: enderecoInstance, usuarioInstance: usuarioInstance])
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
