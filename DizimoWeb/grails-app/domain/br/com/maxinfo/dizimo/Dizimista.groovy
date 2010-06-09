package br.com.maxinfo.dizimo

class Dizimista {

    Date dataCasamento
    String nomeConjuge
    Date dataPrimeiroPagamento
    Date dataAfastamento
    Usuario usuario

    static hasMany = [pagardizimos: Pagardizimo, doacoes: Doacoes]
    
    static constraints = {
    }
}
