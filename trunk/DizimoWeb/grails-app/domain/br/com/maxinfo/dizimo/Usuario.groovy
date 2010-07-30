package br.com.maxinfo.dizimo

/**
 * User domain class.
 */
class Usuario {
	static transients = ['pass']
	static hasMany = [authorities: Permissao]
	static belongsTo = Permissao

	/** Username */
	String username
	/** User Real Name*/
	String userRealName
	/** MD5 Password */
	String passwd
	/** enabled */
	boolean enabled

	String email
	boolean emailShow

	/** description */
	String description = ''

	/** plain password to create a MD5 password */
	String pass = '[secret]'

    Date dataNascimento
    String identidade
    String orgaoExpedidor
    Date criadaEm
    String telefone
	Igreja igreja

    String toString(){
        userRealName
    }

	static constraints = {
		username(blank: false, unique: true)
		userRealName(blank: false)
		passwd(blank: false)
		enabled()
		igreja(nullable:true)
                dataNascimento(nullable:true)
	}
}
