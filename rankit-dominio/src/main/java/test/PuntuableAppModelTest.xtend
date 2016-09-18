package test

import edu.unq.interfaces.rankit_dominio.PuntuableAppModel
import edu.unq.interfaces.rankit_dominio.AdmCalificaciones
import edu.unq.interfaces.rankit_dominio.AdmPuntuables
import static org.junit.Assert.*;
import org.junit.Before
import org.junit.Test

import static org.mockito.Mockito.*
import edu.unq.interfaces.rankit_dominio.Usuario
import edu.unq.interfaces.rankit_dominio.Puntuable

class PuntuableAppModelTest {
	var PuntuableAppModel puntuableAppModelServicios
	var PuntuableAppModel puntuableAppModelLugares
	var AdmCalificaciones admCalificacionesMock
	var AdmPuntuables    admLugaresMock
	var AdmPuntuables    admServiciosMock
	var Usuario          usuarioLogeadoMock
	var Puntuable        lugarMock
	var Puntuable        servicioMock
	
	
	@Before 
	def void setUp(){
		lugarMock=mock(typeof(Puntuable))
		servicioMock=mock(typeof(Puntuable))
		admCalificacionesMock=mock(typeof(AdmCalificaciones))
		admLugaresMock=mock(typeof(AdmPuntuables))
		admServiciosMock=mock(typeof(AdmPuntuables))
		usuarioLogeadoMock=mock(typeof(Usuario))
		puntuableAppModelLugares=new PuntuableAppModel(admLugaresMock,admCalificacionesMock,usuarioLogeadoMock)
		puntuableAppModelServicios=new PuntuableAppModel(admLugaresMock,admCalificacionesMock,usuarioLogeadoMock)
		
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
		assertFalse(puntuableAppModelServicios.hayItemSeleccionado)
	}
	/**
	 * Pruebo que cuando selecciono un lugar 
	 * hay un lugar seleccionado
	 */
	@Test
	def testHayLugarSeleccionado(){
		puntuableAppModelLugares.itemSeleccionado = lugarMock
		assertTrue(puntuableAppModelLugares.hayItemSeleccionado)
		
	}
	/**
	 * Pruebo que cuando selecciono un servicio
	 * hay un servicio seleccionado
	 */
	@Test
	def testHayServicioSeleccionado(){
		puntuableAppModelServicios.itemSeleccionado = servicioMock
		assertTrue(puntuableAppModelServicios.hayItemSeleccionado)
		
	}
	
	
	
	
	/**
	 * Pruebo que el rating promedio del lugar seleccionado es 40
	 */
	@Test
	def testRatingPromedioDeUnLugar(){
		
		when(admCalificacionesMock.ratingPromedio(lugarMock)).thenReturn(40)
		puntuableAppModelLugares.itemSeleccionado = lugarMock
		assertEquals(40,puntuableAppModelLugares.ratingPromedio)
		
	}
	/**
	 * Pruebo que el rating promedio del servicio seleccionado es 30
	 */
	 
	 @Test
	def deRatingPromedioDeUnServicio(){
		
		when(admCalificacionesMock.ratingPromedio(servicioMock)).thenReturn(30)
		puntuableAppModelServicios.itemSeleccionado = servicioMock
		assertEquals(30,puntuableAppModelServicios.ratingPromedio)
		
	}
	
	/**
	 * Pruebo que la cantidad de calificaciones de un lugar es 5
	 */
	 @Test
	 def tesCalificacionesDeUnLugar(){
	 	when(admCalificacionesMock.cantidadDeCalificacionesDelPuntuable(lugarMock)).thenReturn(5)
	 	puntuableAppModelLugares.itemSeleccionado = lugarMock
	 	assertEquals(puntuableAppModelLugares.cantidadDeCalificacionesDelPuntuable,5)
	 }
	/**
	 * Pruebo que la cantidad de calificaciones de un servicio es 2
	 */
}