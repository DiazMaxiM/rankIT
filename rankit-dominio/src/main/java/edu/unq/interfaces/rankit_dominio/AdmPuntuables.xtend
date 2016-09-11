package edu.unq.interfaces.rankit_dominio

import java.util.List
import java.util.ArrayList

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils

@Observable
@Accessors
class AdmPuntuables {
	List<Puntuable> lugares = new ArrayList
	List<Puntuable> servicios = new ArrayList
	
	def todosLosPuntuables()
	{
		val nuevaLista = newArrayList
		nuevaLista.addAll(lugares)
		nuevaLista.addAll(servicios)
		nuevaLista
		
	}
	
	def agregarLugar(Puntuable lugar) {
		lugares.add(lugar)
		this.avisarCambiosDeLugares()
		}
	
	def eliminarLugar(Puntuable lugar) {
		lugares.remove(lugar)
		this.avisarCambiosDeLugares()
	}
	
	def agregarServicio(Puntuable servicio){
		servicios.add(servicio)
	}
	def eliminarServicio(Puntuable servicio){
		servicios.remove(servicio)
	}
	
	def getLugaresInscriptos(){
		lugares.size
	
	}
	
	def getLugaresHabilitados(){
		lugares.filter[lugar|lugar.isHabilitado].toList.size 
	    
	}
	def getLugaresDeshabilitados(){
		getLugaresInscriptos()-getLugaresHabilitados()
	}
	
	def avisarCambiosDeLugares(){
		ObservableUtils.firePropertyChanged(this,"lugaresInscriptos",lugaresInscriptos)
		ObservableUtils.firePropertyChanged(this,"lugaresHabilitados",lugaresHabilitados)
		ObservableUtils.firePropertyChanged(this,"lugaresDeshabilitados",lugaresDeshabilitados)
		
	}

}