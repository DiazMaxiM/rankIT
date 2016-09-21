package edu.unq.interfaces.rankit_dominio

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Dependencies


@Observable
@Accessors

 abstract class PuntuableAppModel implements GenericaAppModel {
	val Puntuable miPuntuableNull = new PuntuableNull
	Usuario usuarioLogeado
	AdmPuntuables administradorDePuntuables
	AdmCalificaciones administradorCalificacion
	Puntuable itemSeleccionado = miPuntuableNull
	String nombreBuscado
	
	new(AdmPuntuables adm1, AdmCalificaciones adm2, Usuario usuarioLogeado) {
		this.administradorDePuntuables = adm1
		this.administradorCalificacion = adm2
		this.usuarioLogeado = usuarioLogeado

	}
	
	def void setItemSeleccionado(Puntuable puntuable){
		 itemSeleccionado = puntuable
		 verificarSiTieneNombre
		 avisarCambios
		
	}
	
	def void verificarSiTieneNombre(){
		 itemSeleccionado.verificarSiTieneNombre
	}
	
	
	@Dependencies("itemSeleccionado")
	def boolean getHayItemSeleccionado(){
		!itemSeleccionado.esIgualA(miPuntuableNull)
	}
	@Dependencies("itemSeleccionado")
	def boolean getHayItemSeleccionadoConNombre(){
	   (!itemSeleccionado.esIgualA(miPuntuableNull))&&(itemSeleccionado.tieneNombre)
	}
	@Dependencies("itemSeleccionado")
	def boolean getHabilitado(){
		itemSeleccionado.habilitado
	}
	@Dependencies("itemSeleccionado")
	def void setHabilitado(boolean bool){
		itemSeleccionado.habilitado = bool
		avisarCambios
	}

	@Dependencies("itemSeleccionado")
	def int getRatingPromedio(){
		administradorCalificacion.ratingPromedio(itemSeleccionado)
	}
    @Dependencies("itemSeleccionado")
	def int getCantidadDeCalificacionesDelPuntuable(){
		administradorCalificacion.cantidadDeCalificacionesDelPuntuable(itemSeleccionado)
	}
	@Dependencies("nombreBuscado")
	def List<Puntuable>getElementos(){
		administradorDePuntuables.buscar(nombreBuscado)
	}
	@Dependencies("itemSeleccionado")
	def String getNombre(){
		itemSeleccionado.nombre
	}
	
	@Dependencies("itemSeleccionado")
	def void setNombre(String nuevoNombre){
		vericarSiHayNombresDuplicados(nuevoNombre)
		itemSeleccionado.nombre = nuevoNombre
		ObservableUtils.firePropertyChanged(this, "nombre", nombre)
	}
	
	def void vericarSiHayNombresDuplicados(String nombre){
		administradorDePuntuables.verificarSiHayDuplicados(nombre)
	}

	
	def int inscriptos(){
	   administradorDePuntuables.inscriptos
	}
	
	def int habilitados(){
		administradorDePuntuables.habilitados
	}
	
	def int deshabilitados(){
		administradorDePuntuables.deshabilitados
	}
	override String getLabelNombre1()
	
	override String tituloContenedorBusqueda()
	
	override String textoPrimerParametroDeBusqueda()
	
	override blanquearContrasenha() {
	}
	
	override CalificacionAppModel getElementosNecesariosParaAdmCalificacionWindow(){
		var CalificacionAppModel calificacionAppModel=new CalificacionAppModel(administradorCalificacion,usuarioLogeado)
		.filtradoObligatorioPorPuntuable(itemSeleccionado)
		calificacionAppModel
	}

	def void avisarCambios(){
		ObservableUtils.firePropertyChanged(this, "hayItemSeleccionado", hayItemSeleccionado)
		ObservableUtils.firePropertyChanged(this, "inscriptos", inscriptos)
		ObservableUtils.firePropertyChanged(this, "habilitados", habilitados)
		ObservableUtils.firePropertyChanged(this, "deshabilitados", deshabilitados)
		ObservableUtils.firePropertyChanged(this, "labelValor1", labelValor1)
		ObservableUtils.firePropertyChanged(this, "labelValor2", labelValor2)
		ObservableUtils.firePropertyChanged(this, "labelValor3", labelValor3)
	}
	
		
	override String getPrimerParametroDeBusqueda() {
	   nombreBuscado
	}
	def void setPrimerParametroDeBusqueda(String nombre) {
		itemSeleccionado=miPuntuableNull
        nombreBuscado = nombre
       ObservableUtils.firePropertyChanged(this, "hayItemSeleccionado",hayItemSeleccionado)
	}
	
	override String getLabelValor1() {
		inscriptos.toString
	
	}
	override String getLabelValor2() {
		habilitados.toString
	}
	
	override String getLabelValor3() {
		deshabilitados.toString 
	}
	
	
	override String getLabelNombre2() {
		"Habilitados: "
	}
	
	
	override String getLabelNombre3() {
		"Deshabilitados"
	}
	
	override String textoSegundoParametroDeBusqueda() {
		""
	}
	
	override String getSegundoParametroDeBusqueda() {
		""
	}
	
   override String getLabelNombre4() {
		""
	}
	
	override String getLabelValor4() {
	   ""
	}
	
	override void nuevo() {
		var puntuable=new Puntuable
		administradorDePuntuables.agregar(puntuable)
		ObservableUtils.firePropertyChanged(this, "elementos", elementos)
		avisarCambios
	}
	
	override void eliminar() {
		administradorDePuntuables.eliminar(itemSeleccionado)
		itemSeleccionado = miPuntuableNull
	    ObservableUtils.firePropertyChanged(this, "elementos", elementos)
        avisarCambios
		
	}
	
}