package br.com.maxinfo.dizimo

class Doacoes {

    Date data
    String valor
    String descricao
    static belongsTo = [igreja: Igreja]
    
    static constraints = {
    }
}
