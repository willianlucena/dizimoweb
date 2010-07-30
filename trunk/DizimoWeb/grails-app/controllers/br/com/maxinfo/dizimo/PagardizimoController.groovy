package br.com.maxinfo.dizimo

class PagardizimoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    Igreja igreja
    Usuario usuario

    def beforeInterceptor = {
        usuario = Usuario.get(session.user.id)
	igreja =  Igreja.get(session.igreja.id)
        println "Tracing action ${actionUri}"
    }

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
//        params.max = Math.min(params.max ? params.int('max') : 10, 100)
//        [pagardizimoInstanceList: Pagardizimo.list(params), pagardizimoInstanceTotal: Pagardizimo.count()]
        def result
	def query = {}

	if (!params.max) params.max = 10
        if (!params.offset) params.offset = 0
        if (!params.sort) params.sort = "id"
        if (!params.order) params.order = "desc"
        def p = Permissao.findByAuthority("ROLE_DIZIMISTA")
        if (usuario.authorities.contains(p)) {
            Dizimista dizimista = Dizimista.findByUsuario(usuario)
            query = {
                eq("igreja", igreja)
                and {
                    eq("dizimista", dizimista)
                }
            }
            result = Pagardizimo.createCriteria().list(max: params.max, offset: params.offset, sort: params.sort, order: params.order, query)
            render(view: "list", model: [pagardizimoInstanceList: result, pagardizimoInstanceTotal: result.totalCount])
        } else {
            query = { eq("igreja", igreja) }
            result = Pagardizimo.createCriteria().list(max: params.max, offset: params.offset, sort: params.sort, order: params.order, query)
            render(view: "list", model: [pagardizimoInstanceList: result, pagardizimoInstanceTotal: result.totalCount])
        }
    }

    def create = {
        def pagardizimoInstance = new Pagardizimo()
        pagardizimoInstance.properties = params
        return [pagardizimoInstance: pagardizimoInstance]
    }

	public static String getNumberFloat(String valor){
		valor = valor.replace('R$ ', '')
		valor = valor.replace('.', '')
		valor = valor.replace(',', '.')
		return valor
	}

    def save = {
        println params
		def user = Usuario.get(Long.parseLong(params.dizimistaId))
		def dizimista  = Dizimista.findByUsuario(user)
		params.dizimista = dizimista
		params.valor = getNumberFloat(params.valor)
		params.igreja = Igreja.get(Long.parseLong(params.igrejaId))
		params.dataPagamento = new Date()
        def pagardizimoInstance = new Pagardizimo(params)
        if (pagardizimoInstance.save(flush: true)) {
            dizimista.dataPrimeiroPagamento = new Date()
            dizimista.save(flush: true)
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'pagardizimo.label', default: 'Pagardizimo'), pagardizimoInstance.id])}"
            redirect(action: "show", id: pagardizimoInstance.id)
        } else {
            render(view: "create", model: [pagardizimoInstance: pagardizimoInstance])
        }
    }

    def show = {
        def pagardizimoInstance = Pagardizimo.get(params.id)
        if (!pagardizimoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pagardizimo.label', default: 'Pagardizimo'), params.id])}"
            redirect(action: "list")
        } else {
            [pagardizimoInstance: pagardizimoInstance]
        }
    }

    def edit = {
        def pagardizimoInstance = Pagardizimo.get(params.id)
        if (!pagardizimoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pagardizimo.label', default: 'Pagardizimo'), params.id])}"
            redirect(action: "list")
        } else {
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
            } else {
                render(view: "edit", model: [pagardizimoInstance: pagardizimoInstance])
            }
        } else {
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
            } catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'pagardizimo.label', default: 'Pagardizimo'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pagardizimo.label', default: 'Pagardizimo'), params.id])}"
            redirect(action: "list")
        }
    }
}