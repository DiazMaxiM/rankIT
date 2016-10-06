package edu.unq.interfaces.rankit_dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class PuntuablesBasicos implements PuntuableAbstracto {
	private int id
	private String nombre
	private TipoDePuntuable tipo
	
	new (Puntuable puntuable,TipoDePuntuable tipo){
		this.id = puntuable.id
		this.nombre = puntuable.nombre
		this.tipo = tipo
	}
	
}