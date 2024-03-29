package br.com.maxinfo.dizimo

import br.com.maxinfo.dizimo.Usuario
import br.com.maxinfo.dizimo.Endereco
import grails.converters.JSON
import org.grails.plugins.springsecurity.service.AuthenticateService
import java.text.DateFormat
import java.util.Date
import java.text.SimpleDateFormat

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
        enderecoInstance.save(flush: true)
        params.criadaEm = new Date()
        params.enabled = true
	params.igreja = session.igreja
	params.passwd = authenticateService.encodePassword(params.passwd)
        try {
            params.dataNascimento = new SimpleDateFormat("dd/MM/yyyy").parse(params.dataNascimento)
            params.dataCasamento = new SimpleDateFormat("dd/MM/yyyy").parse(params.dataCasamento)
        } catch(Exception e){}
        def usuarioInstance = new Usuario(params)
        usuarioInstance.save(flush: true)
//        usuarioInstance.errors.each{
//            println it
//        }
        params.endereco = enderecoInstance
        params.usuario = usuarioInstance
        def dizimistaInstance = new Dizimista(params)
        if (dizimistaInstance.save(flush: true)) {
            Permissao.findByAuthority("ROLE_DIZIMISTA").addToPeople(usuarioInstance)
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'dizimista.label', default: 'Dizimista'), dizimistaInstance.id])}"
            redirect(action: "show", id: dizimistaInstance.id)
        } else {
            render(view: "create", model: [dizimistaInstance: dizimistaInstance])
        }
    }

    def show = {
println params
        def dizimistaInstance = Dizimista.get(params.id)
println dizimistaInstance
        def enderecoInstance = Endereco.get(dizimistaInstance.endereco.id)
        def usuarioInstance = Usuario.get(dizimistaInstance.usuario.id)

        if (!dizimistaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dizimista.label', default: 'Dizimista'), params.id])}"
            redirect(action: "list")
        } else {
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
        } else {
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
            } else {
                render(view: "edit", model: [dizimistaInstance: dizimistaInstance, , enderecoInstance: enderecoInstance, usuarioInstance: usuarioInstance])
            }
        } else {
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
            } catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'dizimista.label', default: 'Dizimista'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dizimista.label', default: 'Dizimista'), params.id])}"
            redirect(action: "list")
        }
    }


    //AJAX
    def dizimistaAjax = {
        println params
        def query = {
                eq("igreja", session.igreja)
                and{
                        ilike("userRealName","%"+params.q+"%")
                        authorities{eq("authority","ROLE_DIZIMISTA")}
                }
        }

        def dizimista = Usuario.createCriteria().list(query)

        //def users =
        println "dizimistas: " + dizimista
        if (dizimista) {
                render dizimista as JSON
        } else {
                response.sendError(400, "Dizimista não encontrado!");
        }
    }
}
