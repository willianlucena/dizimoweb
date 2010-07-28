package br.com.maxinfo.dizimo

class Dizimista {

    Date dataCasamento
    String nomeConjuge
    Date dataPrimeiroPagamento
    Date dataAfastamento
    Usuario usuario
    Endereco endereco
    static hasMany = [pagardizimos: Pagardizimo, doacoes: Doacoes]
    
	String toString(){
		usuario.userRealName
	}
	
    static constraints = {
        dataAfastamento(nullable:true)
        dataPrimeiroPagamento(nullable:true)
		dataCasamento(nullable:true)
		nomeConjuge(nullable:true)
    }
}
