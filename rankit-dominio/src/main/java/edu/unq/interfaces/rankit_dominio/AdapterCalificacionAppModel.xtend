package edu.unq.interfaces.rankit_dominio

import edu.unq.interfaces.rankit_dominio.GenericaAppModel
import edu.unq.interfaces.rankit_dominio.CalificacionAppModel
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class   AdapterCalificacionAppModel implements GenericaAppModel {
	
	private CalificacionAppModel miAppModel;
		
	def setAppModel(CalificacionAppModel calif){
		miAppModel= calif
	}
	new (CalificacionAppModel calif){
		miAppModel= calif
	}
	override String getLabelNombre1() {
	"Calificaciones Registradas:"	
	}
	
	override String getLabelValor1() {
	 miAppModel.calificacionesRegistradas.toString	
	}
	
	override String getLabelNombre2() {
	"Ofensivas:"
	}
	
	override getLabelValor2() {
	miAppModel.calificacionesOfensivas.toString	
	}
	
	override getLabelNombre3() {
	""
	}
	
	override getLabelValor3() {
	""
	}
	
	override getLabelNombre4() {
	""
	}
	
	override getLabelValor4() {
	""
	}
	
	override tituloContenedorBusqueda() {
	"Calificaciones"
	}
	
	override textoPrimerParametroDeBusqueda() {
	"Usuario"	
	}
	
	override getPrimerParametroDeBusqueda() {
	miAppModel.nombreUsuarioBusqueda
	}
	
	def setPrimerParametroDeBusqueda(String nombre) {
	miAppModel.nombreUsuarioBusqueda=nombre
	}
	override textoSegundoParametroDeBusqueda(){
		"Evaluado"
	}
	override getSegundoParametroDeBusqueda() {
	miAppModel.nombreUsuarioBusqueda
	}
	
	def setSegundoParametroDeBusqueda(String nombre) {
	miAppModel.nombreUsuarioBusqueda=nombre
	}
	
	override nuevo() {
		//throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	

	
	
}
