package edu.unq.interfaces.rankit_dominio

import java.util.List
import java.util.ArrayList

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.UserException

@Observable
@Accessors
class AdmPuntuables {
	List<Puntuable> puntuables = new ArrayList
	List<Puntuable>puntuablesCopia= new ArrayList
	
	def getTodosLosPuntuables(){
		puntuables
	}
	def agregar(Puntuable puntuable) {
		puntuables.add(puntuable)
		puntuablesCopia.add(puntuable)
	 }
	
	def eliminar(Puntuable puntuable) {
		puntuables.remove(puntuable)
		puntuablesCopia.remove(puntuable)
	}
	
	def inscriptos() {
		puntuables.size
	}
	
	
	def habilitados(){
		puntuables.filter[puntuable|puntuable.isHabilitado].toList.size 
		
	}
	def deshabilitados(){
		inscriptos()-habilitados()
	}
	
	def isPuntuablesDuplicados(String nombre) {
       puntubleConElnombre(nombre)!=null
   }
    
	
	
	def puntubleConElnombre(String nombre) {
		puntuables.findFirst[puntuable|puntuable.isNombre(nombre)]
	}
	
	def buscar(String letrasDelNombreBuscado) {
		if(letrasDelNombreBuscado!=""){
		   var buscados=this.puntuablesConLasLetras(letrasDelNombreBuscado).toList
		   
		   puntuables=buscados
		}
		else{
			puntuables=puntuablesCopia
		}
		
	}
	

	def puntuablesConLasLetras(String letras) {
		puntuablesCopia.filter[puntuable|puntuable.contieneLasLetras(letras)]
	}
	
	def verificarLugaresDuplicados(String nombre) {
		if(isPuntuablesDuplicados(nombre)){
			throw new UserException("Ya existe otro Lugar con el nombre "+ nombre)
		}
	}
	
	def verificarServiciosDuplicados(String nombre) {
		if(isPuntuablesDuplicados(nombre)){
			throw new UserException("Ya existe otro Servicio con el nombre "+ nombre)
		}
	}
	
	
}