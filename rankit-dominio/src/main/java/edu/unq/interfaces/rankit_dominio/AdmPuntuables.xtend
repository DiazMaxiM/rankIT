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

	def List<Puntuable> buscar(String nombre) {
		  if(!estaVacio(nombre)){
		  	puntuables.filter[puntuable|puntuable.nombreContieneLasLetras(nombre)].toList
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
	
	def void verificarSiHayDuplicados(String nombre) {
		
		if(!puntuablesConElNombre(nombre).empty){
			throw new UserException("Ya existe otro Servicio con el nombre "+ nombre)
		}
	}
	
	
}