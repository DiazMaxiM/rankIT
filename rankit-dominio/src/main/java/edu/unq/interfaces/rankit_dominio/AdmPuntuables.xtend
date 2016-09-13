package edu.unq.interfaces.rankit_dominio

import java.util.List
import java.util.ArrayList

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.UserException

@Observable
@Accessors
class AdmPuntuables {
	List<Puntuable> lugares = new ArrayList
	List<Puntuable> servicios = new ArrayList
	List<Puntuable> lugaresCopia = new ArrayList
   List<Puntuable> serviciosCopia = new ArrayList
	
def todosLosPuntuables()
	{
		val nuevaLista = newArrayList
		nuevaLista.addAll(lugares)
		nuevaLista.addAll(servicios)
		nuevaLista
		
	}
	
	def agregarLugar(Puntuable lugar) {
		lugares.add(lugar)
		lugaresCopia.add(lugar)
	 }
	
	def eliminarLugar(Puntuable lugar) {
		lugares.remove(lugar)
		lugaresCopia.remove(lugar)
	}
	
	def agregarServicio(Puntuable servicio){
		servicios.add(servicio)
		serviciosCopia.add(servicio)
	}
	def eliminarServicio(Puntuable servicio){
		servicios.remove(servicio)
		serviciosCopia.remove(servicio)
	}
	
	def lugaresInscriptos(){
		puntuablesInscriptos(lugares)
	
	}
	
	def serviciosInscriptos(){
		puntuablesInscriptos(servicios)
	
	}
	
	def puntuablesInscriptos(List<Puntuable> puntuables) {
		puntuables.size
	}
	
	def inscriptos(List<Puntuable>puntuables){
		puntuables.size
	}
	
	def lugaresHabilitados(){
		puntuablesHabilitados(lugares)
	    
	}
	
	
	def serviciosHabilitados(){
	   puntuablesHabilitados(servicios)
	}
	
	def puntuablesHabilitados(List<Puntuable>puntuables){
		puntuables.filter[lugar|lugar.isHabilitado].toList.size 
		
	}
	def getLugaresDeshabilitados(){
		lugaresInscriptos()-lugaresHabilitados()
	}
	
	def getServiciosDeshabilitados(){
		serviciosInscriptos()-serviciosHabilitados()
	}
	
	def puntuablesDeshabilitados(List<Puntuable>puntuables){
		puntuablesInscriptos(puntuables)-puntuablesHabilitados(puntuables)
	}
	def isPuntuablesDuplicados(List<Puntuable>puntuables,String nombre) {
       puntubleConElnombre(puntuables,nombre)!=null
   }
    
	
	
	def puntubleConElnombre(List<Puntuable>puntuables,String nombre) {
		puntuables.findFirst[puntuable|puntuable.isNombre(nombre)]
	}
	
	def buscarLugares(String letrasDelNombreBuscado) {
		if(letrasDelNombreBuscado!=""){
		   var lugaresBuscados=this.puntuablesConLasLetras(lugaresCopia,letrasDelNombreBuscado).toList
		   
		   lugares=lugaresBuscados
		}
		else{
			lugares=lugaresCopia
		}
		
	}
	
	
	def buscarServicios(String letrasDelNombreBuscado) {
		if(letrasDelNombreBuscado!=""){
		   var serviciosBuscados=this.puntuablesConLasLetras(servicios,letrasDelNombreBuscado).toList
		   
		   servicios=serviciosBuscados
		}
		else{
			servicios=serviciosCopia
		}
	}
	
	def puntuablesConLasLetras(List<Puntuable> puntuables, String letras) {
		puntuables.filter[lugar|lugar.contieneLasLetras(letras)]
	}
	
	def verificarLugaresDuplicados(String nombre) {
		if(isPuntuablesDuplicados(lugares,nombre)){
			throw new UserException("Ya existe otro Lugar con el nombre "+ nombre)
		}
	}
	
	def verificarServiciosDuplicados(String nombre) {
		if(isPuntuablesDuplicados(servicios,nombre)){
			throw new UserException("Ya existe otro Servicio con el nombre "+ nombre)
		}
	}
	
	
}