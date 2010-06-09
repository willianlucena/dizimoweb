package br.com.maxinfo.dizimo

class Pagardizimo {

    String mesReferencia
    String anoReferencia
    Date dataPagamento
    Float valor

    static belongsTo = [igreja: Igreja, dizimista: Dizimista]

    static constraints = {
    }
}
