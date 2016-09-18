package edu.unq.interfaces.rankit_dominio

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils

@Observable 
@Accessors
class AdapterLugarAppModel implements GenericaAppModel{
	private PuntuableAppModel miAppModel;
	
	
	new(PuntuableAppModel model) {
		this.miAppModel=model
	}
	
	override String getLabelNombre1() {
		"Lugares Inscriptos: "
	}
	
	override String getLabelValor1() {
		var inscriptos=miAppModel.inscriptos
		inscriptos.toString
	}
	
	override String getLabelNombre2() {
		"Habilitados: "
	}
	
	override String getLabelValor2() {
		var habilitados=miAppModel.habilitados.toString
		habilitados.toString
	}
	
	override String getLabelNombre3() {
		"Deshabilitados"
	}
	
	override String getLabelValor3() {
		var deshabilitados=miAppModel.deshabilitados
		deshabilitados.toString
	}
	
	override String getLabelNombre4() {
		""
	}
	
	override String getLabelValor4() {
	   ""
	}
	
	override tituloContenedorBusqueda() {
	   "Lugares"
	}
	
	override textoPrimerParametroDeBusqueda() {
		"Buscar por nombre de Lugar "
	}
	
	override getPrimerParametroDeBusqueda() {
	   miAppModel.nombreBuscado
	}
	def setPrimerParametroDeBusqueda(String nombre) {
	   miAppModel.nombreBuscado=nombre
	}
	
	override textoSegundoParametroDeBusqueda() {
		""
	}
	
	override getSegundoParametroDeBusqueda() {
		""
	}
	
	override nuevo() {
		miAppModel.nuevo
		setActualizar
	}
	
	override eliminar() {
          miAppModel.eliminar
          setActualizar
	} 


	def void setActualizar(){
		ObservableUtils.firePropertyChanged(this, "labelValor1", labelValor1)
		ObservableUtils.firePropertyChanged(this, "labelValor2", labelValor2)
		ObservableUtils.firePropertyChanged(this, "labelValor3", labelValor3)
	}
	
	override getElementosNecesariosParaAdmCalificacionWindow() {
		new AdapterCalificacionAppModel(
			new CalificacionAppModel(
					miAppModel.administradorCalificacion,					    
					miAppModel.usuarioLogeado
					).filtradoObligatorioPorPuntuable(miAppModel.itemSeleccionado))
				
	}
	
	
}