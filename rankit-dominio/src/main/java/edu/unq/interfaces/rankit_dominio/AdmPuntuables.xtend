package edu.unq.interfaces.rankit_dominio

import java.util.List
import java.util.ArrayList

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.UserException
import com.google.common.base.Strings

@Observable
@Accessors
class AdmPuntuables {
	List<Puntuable> puntuables = new ArrayList
	
	def agregar(Puntuable puntuable) {
		puntuables.add(puntuable)
	 }
	
	def eliminar(Puntuable puntuable) {
		puntuables.remove(puntuable)
	}
	
	def inscriptos() {
		puntuables.size
	}
	
	def habilitados(){
		puntuables.filter[puntuable | puntuable.isHabilitado].toList.size 	
	}
	
	def deshabilitados(){
		inscriptos() - habilitados()
	}

	def List<Puntuable> buscar(String nombre) {
		  if(!estaVacio(nombre)){
		  	puntuables.filter[puntuable|puntuable.contieneLasLetras(nombre)].toList
		  }
		  else{
		  	puntuables
		  }
	}
	
	private def estaVacio(String data) {
		Strings.isNullOrEmpty(data)
	}
	
	
	def verificarSiHayDuplicados(String nombre) {
		var puntuablesConElMismoNombre=puntuables.filter[puntuable|puntuable.tieneElNombre(nombre)].toList
		
		if(!puntuablesConElMismoNombre.empty){
			throw new UserException("Ya existe otro Servicio con el nombre "+ nombre)
		}
	}
	
	
}