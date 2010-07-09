package br.com.maxinfo.dizimo

/**
 * Authority domain class.
 */
class Permissao {

	static hasMany = [people: Usuario, igreja: Igreja]

	/** description */
	String description
	/** ROLE String */
	String authority

	static constraints = {
		authority(blank: false, unique: true)
		description()
	}
}
