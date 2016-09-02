package edu.unq.interfaces.rankit_dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

class RankIT {

	@Accessors
	private var List<Puntuable>lugares
	@Accessors
	private var List<Puntuable>servicios
	@Accessors
	private var List<Usuario>usuarios
	
 //Constructor
	 new(){
		this.lugares = newArrayList
		this.servicios = newArrayList
		this.usuarios= newArrayList
	}

	def obtenerLugar(String nombre){
		lugares.findFirst[lugar | lugar.isNombre(nombre)]
	}
	def obtenerServicio(String nombre){
		servicios.findFirst[servicios | servicios.isNombre(nombre)]
	}
	def obtenerUsuario(String nombre){
		usuarios.findFirst[usuarios | usuarios.isNombre(nombre)]
	}
	def String getEstadoUsuario(){
		cantidadUsuariosActivos().toString + " / " + usuarios.size.toString + "( " + cantidadUsuariosBaneados().toString + " )"
	}
	def String getEstadoCalificacion(){
		cantidadDeCalificacionesNoOfensivas().toString + " / " + cantidadDeCalificacionesTotales().toString
	}
	
	def cantidadDeCalificacionesTotales() {
		usuarios.stream.mapToInt( usuario | usuario.cantidadCalificaciones()).sum
	}
	 
	def int cantidadDeCalificacionesNoOfensivas() {
		usuarios.stream.mapToInt( usuario | usuario.cantidadCalificacionesNoOfensiva()).sum
	}
	
	def String getEstadoServicio(){
		"falta"
	}
	def String getEstadoLugar(){
		"falta"
	}
	
	def cantidadUsuariosBaneados() {
		usuarios.filter[ usuario | usuario.isBaneado ].size	
	}
	
	def int cantidadUsuariosActivos() {
		usuarios.filter[ usuario | usuario.isActivo ].size	
	}

}