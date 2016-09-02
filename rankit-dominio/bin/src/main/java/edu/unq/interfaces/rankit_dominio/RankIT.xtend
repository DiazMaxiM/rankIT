package edu.unq.interfaces.rankit_dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class RankIT {
	private var List<Puntuable>lugares
	private var List<Puntuable>servicios
	private var List<Calificacion>calificaciones
	private var List<Usuario>usuarios
	
 //Constructor
	 new(){
		this.lugares = newArrayList
		this.servicios = newArrayList
		this.calificaciones= newArrayList
		this.usuarios= newArrayList
	}
	

/** Lugares y Servicios */	
	def void agregarLugarNuevo() {
		var lugar=new Lugar
		lugares.add(lugar)
	}
	
	def void agregarServicioNuevo() {
	    var servicio=new Servicio
	    servicios.add(servicio)  
	}
	
	def Lugar devolverLugarSinDatos(){
		
		var lugar=devolverPuntuableSinDatos(lugares)
		lugares.remove(lugar)
		lugar as Lugar
		
	}
	
	def Servicio devolverServicioSinDatos(){
		
		var servicio=devolverPuntuableSinDatos(servicios)
	    servicios.remove(servicio)
		servicio as Servicio
		
	}
	
	def Puntuable devolverPuntuableSinDatos(List<Puntuable>puntuables){
		var puntuable= puntuables.findFirst[puntuable|puntuable.noTieneNombreAsignado()]
		puntuable
	}
	
	def void asignarNombreAlLugar(Lugar lugar,String nuevoNombre){
	    asignarNombreAlPuntuable(lugares,lugar,nuevoNombre)
	}
	
	def void asignarNombreAlServicio(Servicio servicio,String nuevoNombre){
	    asignarNombreAlPuntuable(servicios,servicio,nuevoNombre)
		
	}
	
	def asignarNombreAlPuntuable(List<Puntuable>puntuables,Puntuable puntuable, String nuevoNombre){
		puntuable.cambiarNombre(nuevoNombre)
		puntuables.add(puntuable)
	}
	
	
	def int lugaresDeshabilitados() {
		puntuablesDeshabilitados(lugares)
		
	}
	
	def int serviciosDeshabilitados(){
		puntuablesDeshabilitados(servicios)
	
	}
	
	
	def int puntuablesDeshabilitados(List<Puntuable> puntuables) {
	    var deshabilitados=puntuables.filter[puntuable|puntuable.estaDeshabilitado()]
	    deshabilitados.size
	}
	
	
	def int lugaresHabilitados() {
		puntuablesHabilitados(lugares)
		
	}
	
	def int serviciosHabilitados(){
		puntuablesHabilitados(servicios)
	
	}
	
	def int puntuablesHabilitados(List<Puntuable> puntuables) {
		
		var habilitados=puntuables.filter[puntuable|puntuable.estaHabilitado()]
	    habilitados.size
		
	}
	
	def void habilitarLugar(Puntuable puntuable){
		
		puntuable.habilitarPuntuable()
	}
	
	def void habilitarServicio(Puntuable puntuable) {
		
		puntuable.habilitarPuntuable()
	}
	
	def void deshabilitarLugar(Puntuable puntuable){
		
		puntuable.deshabilitarPuntuable()
	}
	
	def void deshabilitarServicio(Puntuable puntuable){
		
		puntuable.deshabilitarPuntuable()
	}
	
	def int lugaresInscriptos() {
		puntuablesInscriptos(lugares)
	}
	
	def void eliminarLugar(Lugar lugar) {
		eliminarPuntuable(lugares,lugar)
	}
	
	def Puntuable buscarLugarPorSuNombre(String nombre) {
		buscarPuntuablePorSuNombre(lugares,nombre)
	}
	
	def Puntuable buscarServicioPorSuNombre(String nombre) {
		buscarPuntuablePorSuNombre(servicios,nombre)
	}
	
	def Puntuable buscarPuntuablePorSuNombre(List<Puntuable> puntuables, String nombre) {
	    puntuables.findFirst[puntuable|puntuable.tieneEsteNombre(nombre)]
	}
	
	
	def int serviciosInscriptos() {
		puntuablesInscriptos(servicios)
	}
	
	def int  puntuablesInscriptos(List<Puntuable> puntuables) {
		puntuables.size
	}
	
	def void eliminarServicio(Servicio servicio) {
		eliminarPuntuable(servicios, servicio)
		
	}
	
	def void  eliminarPuntuable(List<Puntuable> puntuables,Puntuable puntuable) {
		if(puntuables.contains(puntuable)){
			puntuables.remove(puntuable)
		}
		else{
			throw new NoSePuedeEliminarException("El«puntuable» no está dentro de Rank IT")
		}
	}
	
	
	def int calificacionesRegistradas(){
		calificaciones.size
	} 
	
	def int  calificacionesOfensivas(){
		var ofensivas= calificaciones.filter[calificacion|calificacion.esCalificacionOfensiva()]
		ofensivas.size
	}
	
 /**
  * 
  * Usuarios
  */	
 
 
	def void  agregarUsuario() {
		var usuario=new Usuario("NN","123")
		usuarios.add(usuario)
	}
	
	def Usuario devolverUsuarioSinDatos() {
	   var usuario= buscarUsuarioPorSuNombre("NN")
	   usuarios.remove(usuario)
	   usuario
	}
 	
	def cambiarNombreDelUsuario(Usuario usuario, String nombre) {
	    usuario.cambiarNombre(nombre)	
		usuarios.add(usuario)
	}
	
	def int usuariosRegistrados() {
		usuarios.size
	}
	
	def void activarUsuario(Usuario usuario) {
		usuario.activarUsuario()
	}
	
	def int usuariosActivos() {
		var activos=usuarios.filter[usuario|usuario.esUsuarioActivo()]
		activos.size
	}
	
	def int  usuariosInactivos() {
		var inactivos=usuarios.filter[usuario|usuario.esUsuarioInactivo()]
		inactivos.size

	}
	
	def void banearUsuario(Usuario usuario) {
		usuario.banearUsuario()
	}
	
	def int usuariosBaneados() {
		var baneados= usuarios.filter[usuario|usuario.esUsuarioBaneado()]
		baneados.size
	}
	
	def Usuario buscarUsuarioPorSuNombre(String nombre) {
		
		var usuario=usuarios.findFirst[usuario|usuario.tieneElMismoNombre(nombre)]
		usuario 
	}
	
	def eliminarUsuario(Usuario usuario) {
		if(usuarios.contains(usuario)){
			usuarios.remove(usuario)
		}
		else{
		  new NoHayUsuarioRegistradoEnRankItException("El«usuario» no se encuentra registrado en Rank IT")
		}
	}
	
	/**
	 * Calificaciones
	 */
     
	def void crearCalificacionNueva() {
		var usuario= new Usuario("ADMIN","1234")
     	var calificacion=new Calificacion(usuario)
        calificaciones.add(calificacion)
	}
	
	def Calificacion devolverCalificacionSinDatos(){
		var calificacion=calificaciones.findFirst[calificacion|calificacion.sinDescripcion()]
		calificaciones.remove(calificacion)
		calificacion
	}
	
	def void cambiarNombreDeUsuarioDeLaCalificacion(Calificacion calificacion,Usuario usuario) {
	    calificacion.cambiarUsuario(usuario)
		calificaciones.add(calificacion)
	}
	
/** 
 * En este metodo se califica una calificacion como ofensiva 
 * y ademas verifica si el usuario tiene cinco calificaciones ofensivas 
 */
	
	def void calificarCalificacionComoOfensiva(Calificacion calificacion){
		calificacion.marcarComoContenidoOfensivo()
		var usuario= calificacion.devolverUsuario()
		inhabilitarUsuarioEnCasoDeTenerCincoCalificacionesOfensivas(usuario)
	}
	
/** 
 * En este metodo tomo las calificaciones ofensivas del usuario y verifico si son cinco 
 * en caso de serlo este usuario queda inactivo  
 */	

	def inhabilitarUsuarioEnCasoDeTenerCincoCalificacionesOfensivas(Usuario usuario) {
	   var calificacionesDelUsuario=calificaciones.filter[calificacion|calificacion.tieneEsteUsuario(usuario)&&calificacion.esCalificacionOfensiva()]
	   if(calificacionesDelUsuario.size==5){
	   	  usuario.banearUsuario()
	   }
	}

	def int cantidadDeCalificacionesRegistradas(){
		
		calificaciones.size
	}
	
	def int cantidadDeCalificacionesOfensivas() {
		var calificacionesOfensivas=calificaciones.filter[calificacion|calificacion.esCalificacionOfensiva()]
	    calificacionesOfensivas.size 
	}
	
	
	def void eliminarCalificacion(Calificacion calificacion){
		calificaciones.remove(calificacion)
	}
 	
 	def Calificacion devolverCalificacionPorNombreDeUsuario(Usuario usuario){
 		var calificacion=calificaciones.findFirst[calificacion|calificacion.tieneEsteUsuario(usuario)]
 		calificacion
 	}
	
	def devolverCalificacionPorNombre(Usuario usuario){
 		var calificacionesDelUsuario=calificaciones.filter[calificacion|calificacion.tieneEsteUsuario(usuario)]
 	    calificacionesDelUsuario.toList
 	}
	
	def devolverCalificacionPorEvaluado(Puntuable puntuable){
	    var calificacionesDeLoEvaluado=calificaciones.filter[calificacion|calificacion.evaluaEstePuntuable(puntuable)]
 		calificacionesDeLoEvaluado.toList
	}
	
 	
 }
	
	
	
