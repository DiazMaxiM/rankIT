package test

import edu.unq.interfaces.rankit_dominio.PuntuableAppModel
import edu.unq.interfaces.rankit_dominio.AdmCalificaciones
import edu.unq.interfaces.rankit_dominio.AdmPuntuables
import static org.junit.Assert.*;
import org.junit.Before
import org.junit.Test


import edu.unq.interfaces.rankit_dominio.Usuario
import edu.unq.interfaces.rankit_dominio.Puntuable
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.model.UserException
import edu.unq.interfaces.rankit_dominio.Calificacion
import edu.unq.interfaces.rankit_dominio.LugarAppModel
import edu.unq.interfaces.rankit_dominio.ServicioAppModel

class PuntuableAppModelTest {
	var PuntuableAppModel puntuableAppServicios
	var PuntuableAppModel puntuableAppModelLugares
	var AdmCalificaciones admCalificaciones
	var AdmPuntuables    admLugares
	var AdmPuntuables    admServicios
	var Usuario          usuarioLogeado
	var Puntuable        lugar
	var Puntuable        servicio
	
	
	@Before 
	def void setUp(){
		lugar=new Puntuable
		servicio=new Puntuable
		admCalificaciones=new AdmCalificaciones
		admLugares=new AdmPuntuables
		admServicios=new AdmPuntuables
		usuarioLogeado=new Usuario
		puntuableAppModelLugares=new LugarAppModel(admLugares,admCalificaciones,usuarioLogeado)
		puntuableAppServicios=new ServicioAppModel(admServicios,admCalificaciones,usuarioLogeado)
		
	}
	/**
	 * Pruebo que cuando no seteo un lugar, no hay 
	 * un lugar seleccionado
	 */
	@Test
	def testNoHayLugarSeleccionado(){
		assertFalse(puntuableAppModelLugares.hayItemSeleccionado)
	}
	
	/**
	 * Pruebo que cuando no seteo un servicio, no hay 
	 * un servicio seleccionado
	 */
	@Test
	def testNoHayServicioSeleccionado(){
		assertFalse(puntuableAppServicios.hayItemSeleccionado)
	}
	/**
	 * Pruebo que cuando selecciono un lugar 
	 * hay un lugar seleccionado
	 */
	@Test
	def testHayLugarSeleccionado(){
		lugar.nombre="Autoservicio San Cayetano"
		puntuableAppModelLugares.itemSeleccionado = lugar
		assertTrue(puntuableAppModelLugares.hayItemSeleccionado)
		
	}
	
	/**
	 * En este test pruebo que cuando selecciono un lugar 
	 * y este no tiene un nombre, se manda una UserException
	 */
	 @Test(expected=UserException)
	 def testSeleccionoUnLugarSinNombreYSaltaUnUserException(){
	 	 puntuableAppModelLugares.itemSeleccionado = lugar
	 }
	 
	/**
	 * Pruebo que cuando selecciono un servicio
	 * hay un servicio seleccionado
	 */
	@Test
	def testHayServicioSeleccionado(){
		servicio.nombre="Movistar"
		puntuableAppServicios.itemSeleccionado = servicio
		assertTrue(puntuableAppServicios.hayItemSeleccionado)
		
	}
	
	/**
	 * En este test pruebo que cuando selecciono un servicio 
	 * y este no tiene un nombre, se manda una UserException
	 */
	 @Test(expected=UserException)
	 def testSeleccionoUnServicioSinNombreYSaltaUnUserException(){
	 	 puntuableAppServicios.itemSeleccionado = servicio
	 }
	 /**
	  * En este test pruebo que cuando intento cambiarle el nombre a un 
	  * lugar este esta repetido 
	  */
	@Test(expected=UserException)
	def testCambiarElNombreAUnLugarPorOtroQueYaEstaRegistrado(){
		var lugarDentroDelAdministrador= new Puntuable
		lugarDentroDelAdministrador.nombre="Fredo"
		admLugares.agregar(lugarDentroDelAdministrador)
		lugar.nombre = "Hoyts Quilmes"
		puntuableAppModelLugares.itemSeleccionado = lugar
		puntuableAppModelLugares.nombre = "Fredo"
		
	}
	
	@Test(expected=UserException)
	def testQuieroCambiarleDeNombreAUnServicioPorUnoQueEstaRepetido(){
		var servicioRegistrado= new Puntuable
		servicioRegistrado.nombre="Metrogas"
		admServicios.agregar(servicioRegistrado)
		servicio.nombre = "Edesur"
		puntuableAppServicios.itemSeleccionado = servicio
		puntuableAppServicios.nombre = "Metrogas"
		
	}
	
	/**
	 * Pruebo que cuando busco un lugar por su nombre 
	 * se actualiza la lista de lugares seleccionados
	 * 
	 */
	 @Test
	 def testEncontrarUnLugarPorSuNombre(){
	 	//Cargo varios lugares al admDeLugares
	 	var lugar1=new Puntuable
	 	lugar1.nombre="Ahora son 13"
	 	var lugar2=new Puntuable
	 	lugar2.nombre="Dino Burguer"
	 	var lugar3=new Puntuable
	 	lugar3.nombre="La Juana"
	 	admLugares.agregar(lugar1)
	 	admLugares.agregar(lugar2)
	 	admLugares.agregar(lugar3)
	 	//busco un lugar por el nombre
	    puntuableAppModelLugares.nombreBuscado = "La Juana"
		
	    assertTrue(puntuableAppModelLugares.elementos.contains(lugar3))
	    assertFalse(puntuableAppModelLugares.elementos.contains(lugar1))
	     assertFalse(puntuableAppModelLugares.elementos.contains(lugar2))
	 }
	 
	 /**
	  * Pruebo que cuando busco un servicio por su nombre 
	  * se actualiza la lista de servicios seleccionados 
	  */
	@Test 
	def testEncontrarUnServicioPorSuNombre(){
	    //Cargo varios servicios al admDeServicios
	 	var servicio1=new Puntuable
	 	servicio1.nombre="Metrogas"
	 	var servicio2=new Puntuable
	 	servicio2.nombre="Edesur" 
	 	var servicio3=new Puntuable
	 	servicio3.nombre="Edenor"
	 	admServicios.agregar(servicio1)
	 	admServicios.agregar(servicio2)
	 	admServicios.agregar(servicio2)
	 	//busco un lugar por el nombre
	    puntuableAppServicios.nombreBuscado = "Edesur"
		
	    assertTrue(puntuableAppServicios.elementos.contains(servicio2))
	    assertFalse(puntuableAppServicios.elementos.contains(servicio3))
	     assertFalse(puntuableAppServicios.elementos.contains(servicio1))
		
	}
	/**
	 * Pruebo que cuando busco un lugar por su nombre 
	 * y no esta registrado, la lista de lugares con ese nombre es vacio 
	 */
	@Test
	def testNoEncontarUnLugarCuandoBuscoPorSuNombre(){
		//Cargo varios lugares al admDeLugares
	 	var lugar1=new Puntuable
	 	lugar1.nombre="Ahora son 13"
	 	var lugar2=new Puntuable
	 	lugar2.nombre="Dino Burguer"
	 	var lugar3=new Puntuable
	 	lugar3.nombre="La Juana"
	 	admLugares.agregar(lugar1)
	 	admLugares.agregar(lugar2)
	 	admLugares.agregar(lugar3)
	 	//busco un lugar por el nombre
	    puntuableAppModelLugares.nombreBuscado = "Freddo"
		
	    assertTrue(puntuableAppModelLugares.elementos.isEmpty)
		
	}
	
		/**
	 * Pruebo que cuando busco un servicio por su nombre 
	 * y no esta registrado, la lista de servicios con ese nombre es vacio 
	 */
	@Test
	def testNoEncontarUnServicioCuandoBuscoPorSuNombre(){
	      //Cargo varios servicios al admDeServicios
	 	var servicio1=new Puntuable
	 	servicio1.nombre="Metrogas"
	 	var servicio2=new Puntuable
	 	servicio2.nombre="Edesur" 
	 	var servicio3=new Puntuable
	 	servicio3.nombre="Edenor"
	 	admServicios.agregar(servicio1)
	 	admServicios.agregar(servicio2)
	 	admServicios.agregar(servicio2)
	 	//busco un lugar por el nombre
	    puntuableAppServicios.nombreBuscado = "Movistar"
	    
	    assertTrue(puntuableAppServicios.elementos.isEmpty)
				
	}
	

	/**
	 * Pruebo que el rating promedio del lugar seleccionado es 10
	 */
	@Test
	def testRatingPromedioDeUnLugar(){
		lugar.nombre = "Hoyts Quilmes"
		var lugar2=new Puntuable
	 	lugar2.nombre="Dino Burguer"
		var calificacion1=new Calificacion(usuarioLogeado)
		var calificacion2=new Calificacion(usuarioLogeado)
		var Calificacion3=new Calificacion(usuarioLogeado)
		//indico el evaluado y el puntaje
		calificacion1.evaluado=lugar
		calificacion1.puntos = 10
		calificacion2.evaluado=lugar2
		calificacion2.puntos=25
		Calificacion3.evaluado=lugar
		Calificacion3.puntos=10
		//agrego las calificaciones al administrador
		admCalificaciones.agregarCalificacion(calificacion1)
		admCalificaciones.agregarCalificacion(calificacion2)
		admCalificaciones.agregarCalificacion(Calificacion3)
		puntuableAppModelLugares.itemSeleccionado = lugar
		assertEquals(10,puntuableAppModelLugares.ratingPromedio)
		
    }

	/**
	 * Pruebo que el rating promedio del servicio seleccionado es 1
	 */
	 
	 @Test
	def testRatingPromedioDeUnServicio(){
		servicio.nombre = "Edesur"
		var servicio2=new Puntuable 
	 	servicio2.nombre="Metrogas"
		var calificacion1=new Calificacion(usuarioLogeado)
		var calificacion2=new Calificacion(usuarioLogeado)
		var Calificacion3=new Calificacion(usuarioLogeado)
		//indico el evaluado y el puntaje
		calificacion1.evaluado=servicio
		calificacion1.puntos = 1
		calificacion2.evaluado=servicio2
		calificacion2.puntos=1
		Calificacion3.evaluado=servicio
		Calificacion3.puntos=1
		//agrego las calificaciones al administrador
		admCalificaciones.agregarCalificacion(calificacion1)
		admCalificaciones.agregarCalificacion(calificacion2)
		admCalificaciones.agregarCalificacion(Calificacion3)
		puntuableAppServicios.itemSeleccionado = servicio
		assertEquals(1,puntuableAppServicios.ratingPromedio)
		

	}
	
	/**
	 * 	 * Pruebo que la cantidad de calificaciones de un lugar es 2
	 */
	 @Test
	 def testCalificacionesDeUnLugar(){
	 	lugar.nombre = "Hoyts Quilmes"
		var lugar2=new Puntuable
	 	lugar2.nombre="Dino Burguer"
		var calificacion1=new Calificacion(usuarioLogeado)
		var calificacion2=new Calificacion(usuarioLogeado)
		var Calificacion3=new Calificacion(usuarioLogeado)
		//indico el evaluado y el puntaje
		calificacion1.evaluado=lugar
		calificacion1.puntos = 10
		calificacion2.evaluado=lugar2
		calificacion2.puntos=25
		Calificacion3.evaluado=lugar
		Calificacion3.puntos=10
		//agrego las calificaciones al administrador
		admCalificaciones.agregarCalificacion(calificacion1)
		admCalificaciones.agregarCalificacion(calificacion2)
		admCalificaciones.agregarCalificacion(Calificacion3)
		puntuableAppModelLugares.itemSeleccionado = lugar
		assertEquals(2,puntuableAppModelLugares.cantidadDeCalificacionesDelPuntuable)

	 }
	 
	  
	/**
	 * Pruebo que la cantidad de calificaciones de un servicio es 1
	 */
	  @Test
	 def tesCalificacionesDeUnServicio(){
        	servicio.nombre = "Edesur"
		var servicio2=new Puntuable 
	 	servicio2.nombre="Metrogas"
		var calificacion1=new Calificacion(usuarioLogeado)
		var calificacion2=new Calificacion(usuarioLogeado)
		var Calificacion3=new Calificacion(usuarioLogeado)
		//indico el evaluado y el puntaje
		calificacion1.evaluado=servicio
		calificacion1.puntos = 1
		calificacion2.evaluado=servicio2
		calificacion2.puntos=1
		Calificacion3.evaluado=servicio
		Calificacion3.puntos=1
		//agrego las calificaciones al administrador
		admCalificaciones.agregarCalificacion(calificacion1)
		admCalificaciones.agregarCalificacion(calificacion2)
		admCalificaciones.agregarCalificacion(Calificacion3)
		puntuableAppServicios.itemSeleccionado = servicio2
	 	assertEquals(puntuableAppServicios.cantidadDeCalificacionesDelPuntuable,1)
	 }
}