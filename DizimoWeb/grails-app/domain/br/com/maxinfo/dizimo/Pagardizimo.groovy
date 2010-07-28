package br.com.maxinfo.dizimo

class Pagardizimo {

    String mesReferencia
    String anoReferencia
    Date dataPagamento
    String valor

    static belongsTo = [igreja: Igreja, dizimista: Dizimista]

    static constraints = {
		mesReferencia(inList:["JANEIRO","FEVEREIRO","MARÇO","ABRIL","MAIO","JUNHO","JULHO","AGOSTO","SETEMBRO","OUTUBRO","NOVEMBRO","DEZEMBRO"])
		anoReferencia(inList:["2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021"])
    }
}
