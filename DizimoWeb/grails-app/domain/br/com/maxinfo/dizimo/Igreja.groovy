package br.com.maxinfo.dizimo

class Igreja {

    String nome
    Endereco endereco

    //ROLES para diferenciar se a igreja será uma paróquia ou não e assim saber por quem e quem
    //será a igreja administradoras das outras.
    static hasMany = [authorities: Permissao, pagardizimos: Pagardizimo, doacoes: Doacoes]
    static belongsTo = Permissao
	
	String toString(){
		nome
	}
	
    static constraints = {
		endereco(nullable:true)
    }
}
