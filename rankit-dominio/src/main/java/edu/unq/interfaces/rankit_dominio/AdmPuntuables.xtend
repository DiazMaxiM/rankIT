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
	
	def void agregar(Puntuable puntuable) {
		puntuables.add(puntuable)
	 }
	
	def void eliminar(Puntuable puntuable) {
		puntuables.remove(puntuable)
	}
	
	def int inscriptos() {
		puntuables.size
	}
	
	def int  habilitados(){
		puntuables.filter[puntuable | puntuable.isHabilitado].toList.size 	
	}
	
	def int deshabilitados(){
		inscriptos() - habilitados()
	}

	def List<Puntuable> buscarPuntuables(String nombre) {
		  if(!estaVacio(nombre)){
		  	 puntuablesConLasLetras(nombre)
		  }
		  else{
		  	puntuables
		  }
	}
	
	private def boolean estaVacio(String data) {
		Strings.isNullOrEmpty(data)
	}
	
	private def List<Puntuable>puntuablesConElNombre(String nombre){
		puntuables.filter[puntuable|puntuable.tieneElNombre(nombre)].toList
	}
	
	private def List<Puntuable>puntuablesConLasLetras(String nombre){
		puntuables.filter[puntuable|puntuable.nombreContieneLasLetras(nombre)].toList
		
	}

	
	def void cambiarNombreSiPuedeDelPuntuable(Puntuable puntuable,String nombre) {
		  if (puedoCambiarElNombreDelPuntuable(nombre)){
		  	   puntuable.nombre = nombre
		  }
	}
	
	private def boolean puedoCambiarElNombreDelPuntuable(String nombre){
		  !(esVacio(nombre)||hayUnPuntuableConElNombre(nombre))
	}
	
	private def boolean esVacio(String nombre){
		 if(estaVacio(nombre)){
		 	throw new UserException("Por favor defina un nombre" )
		 }
		 estaVacio(nombre)
	}
	
	private def boolean hayUnPuntuableConElNombre(String nombre){
		if(hayPuntuableConElNombre(nombre)){
			throw new UserException("Ya existe otro Servicio con el nombre "+ nombre)
	    }
		hayPuntuableConElNombre(nombre)
	}
	
	private def boolean hayPuntuableConElNombre(String nombre){
		!(puntuablesConElNombre(nombre).empty)
	}
}