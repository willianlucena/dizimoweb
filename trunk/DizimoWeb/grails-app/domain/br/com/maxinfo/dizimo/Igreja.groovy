package br.com.maxinfo.dizimo

class Igreja {

    String nome
    String coordenador
    Endereco endereco
    static hasMany = [pagardizimos: Pagardizimo, doacoes: Doacoes]

    static constraints = {
    }
}
