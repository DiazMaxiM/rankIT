package test
import edu.unq.interfaces.rankit_dominio.AdmPuntuables
import org.junit.Test
import static org.junit.Assert.*;
import edu.unq.interfaces.rankit_dominio.Puntuable
import org.uqbar.commons.model.UserException

class AdmPuntuablesTest {
	
	 /**
	  * Pruebo que al agregar tres lugares al admistrador de 
	  * puntuables, se actualizan la cantidad de lugares inscriptos
	  */
	 @Test
	 def testCantidadDeLugaresInscriptos(){
	 	var admLugares= new AdmPuntuables()
	 	var lugar1= new Puntuable
	    var lugar2= new Puntuable
	    var lugar3= new Puntuable
	 	admLugares.agregar(lugar1)
	 	admLugares.agregar(lugar2)
	 	admLugares.agregar(lugar3)
        assertEquals(admLugares.inscriptos,3)
	 	
	 }
	 
	  /**
	  * Pruebo que al eliminar un servicio al admistrador
	  *  se actualiza la cantidad de lugares inscriptos
	  */
	 @Test
	 def testCantidadDeServiciosInscriptosDespuesDeEliminarUnServicio(){
	 	var admServicios= new AdmPuntuables()
	 	var servicio1= new Puntuable
	    var servicio2= new Puntuable
	    var servicio3= new Puntuable
	 	admServicios.agregar(servicio1)
	 	admServicios.agregar(servicio2)
	 	admServicios.agregar(servicio3)
	 	admServicios.eliminar(servicio2)
	 	
        assertEquals(admServicios.inscriptos,2)
        assertTrue(admServicios.puntuables.contains(servicio1))
	 	assertTrue(admServicios.puntuables.contains(servicio3))
	 	assertFalse(admServicios.puntuables.contains(servicio2))
	 	
	 }
	 
	 
	 /**
	  * Pruebo que al agregar tres lugares al admisitrador de 
	  * puntuables, se actualizan los lugares Deshabilitados 
	  */
	 @Test 
	 def testCantidadDeLugaresDeshabilitados(){
	 	var admLugares= new AdmPuntuables()
	 	var lugar1= new Puntuable
	    var lugar2= new Puntuable
	    var lugar3= new Puntuable
	 	admLugares.agregar(lugar1)
	 	admLugares.agregar(lugar2)
	 	admLugares.agregar(lugar3)
        assertEquals(admLugares.deshabilitados,3)
	 	
	 }
	 
	 
	 /**
	  * Pruebo que al agregar tres lugares al admisitrador de 
	  * puntuables y al habilitar dos, se actualizan los lugares habilitados
	  */
	 @Test 
	 def testCantidadDeLugaresHabilitados(){
	 	var admLugares= new AdmPuntuables()
	 	var lugar1= new Puntuable
	    var lugar2= new Puntuable
	    var lugar3= new Puntuable
	 	admLugares.agregar(lugar1)
	 	admLugares.agregar(lugar2)
	 	admLugares.agregar(lugar3)
	 	lugar1.nombre="Freddo"
	 	lugar1.habilitado=true
	 	lugar3.nombre="San Cayetano"
	 	lugar3.habilitado=true
        assertEquals(admLugares.habilitados,2)
 
	 	
	 }
	 
	 
	  /**
	  * Pruebo que al agregar tres servicios al admistrador de 
	  * puntuables y al habilitar dos, se actualizan los servicios Deshabilitados
	  */
	 @Test
	 def testCantidadDeServiciosDeshabilitados(){
	 	var admServicios= new AdmPuntuables()
	    var servicio1= new Puntuable
	    var servicio2= new Puntuable
	    var servicio3= new Puntuable
	 	admServicios.agregar(servicio1)
	 	admServicios.agregar(servicio2)
	 	admServicios.agregar(servicio3)
	 	servicio1.nombre="Metrogas"
	 	servicio1.habilitado=true
	 	servicio3.nombre="Edesur"
	 	servicio3.habilitado=true
        assertEquals(admServicios.deshabilitados,1)
	 	
	 }
	 /**
	  * Pruebo que al buscar un lugar sin enviarle datos
	  * me devuelve todos los lugares inscriptos
	  */
	 @Test 
	 def testBuscarUnLugarPorNombre(){
	 	var admLugares= new AdmPuntuables()
	    var lugar1= new Puntuable
	    lugar1.nombre="San Cayetano"
	    var lugar2= new Puntuable
	    lugar2.nombre="Yona"
	    var lugar3= new Puntuable
	    lugar3.nombre="Sushi pop"
	 	admLugares.agregar(lugar1)
	 	admLugares.agregar(lugar2)
	 	admLugares.agregar(lugar3)
	 	
	 	assertEquals(admLugares.buscarPuntuables("").size,3)
	 	assertTrue(admLugares.puntuables.contains(lugar1))
	 	assertTrue(admLugares.puntuables.contains(lugar2))
	 	assertTrue(admLugares.puntuables.contains(lugar3))
	 	
	 }
	 
	 
	  /**
	  * En este test pruebo que al buscar un lugar por sus letras
	  * me devuelve todos los lugares que contienen las letras ingresadas
	  */
	 @Test 
	 def testBuscarLugaresPorLetras(){
	 	var admLugares= new AdmPuntuables()
	 	var lugar1= new Puntuable
	    var lugar2= new Puntuable
	    var lugar3= new Puntuable
	    lugar3.nombre="Fravega"
	    lugar2.nombre="Yona"
	    lugar1.nombre="San Cayetano"
	 	admLugares.agregar(lugar1)
	 	admLugares.agregar(lugar2)
	 	admLugares.agregar(lugar3)
	 	
	 	assertEquals(2,admLugares.buscarPuntuables("n").size)
	 	assertTrue(admLugares.buscarPuntuables("n").contains(lugar2))
	 	assertTrue(admLugares.buscarPuntuables("n").contains(lugar1))
	 	assertFalse(admLugares.buscarPuntuables("n").contains(lugar3))
	 }
	 
	  /**
	  * Pruebo que cuando busco un servicio que no esta inscripto 
	  * no hay resultados 
	  */
	 @Test 
	 def testNoHayServicioConElNombre(){
	 	var admServicios= new AdmPuntuables()
	 	var servicio1= new Puntuable
	    var servicio2= new Puntuable
	    var servicio3= new Puntuable
	 	admServicios.agregar(servicio1)
	 	admServicios.agregar(servicio2)
	 	admServicios.agregar(servicio3)
	 	servicio1.nombre="Metrogas"
	 	servicio2.nombre="Edesur"
	 	servicio3.nombre="Movistar"
	 	
	 	assertEquals(admServicios.buscarPuntuables("Edenor").size,0)
	 	
	 }
	 
	  /**
	  * Prue que al buscar un lugar que no esta inscripto 
	  * no hay resultados 
	  */
	 @Test 
	 def testNoHayLugaresConLasLetras(){
	 	var admLugares= new AdmPuntuables()
	 	var lugar1= new Puntuable
	    var lugar2= new Puntuable
	    var lugar3= new Puntuable
	    lugar3.nombre="Fravega"
	    lugar2.nombre="Yona"
	    lugar1.nombre="San Cayetano"
	 	admLugares.agregar(lugar1)
	 	admLugares.agregar(lugar2)
	 	admLugares.agregar(lugar3)
	 	
	 	assertEquals(admLugares.buscarPuntuables("h").size,0)
	 }
	 
	 /**
	   Verifico si el nombre de un lugar ya esta usado
	  */
	 @Test(expected=UserException )
	 def testYaExisteUnLugarConELNombreQueSeQuiereUsar(){
	 	
	 	var admLugares= new AdmPuntuables()
	 	var lugar1= new Puntuable
	    var lugar2= new Puntuable
	    var lugar3= new Puntuable
	    lugar3.nombre="Fravega"
	    lugar2.nombre="Yona"
	    lugar1.nombre="Fravega"
	 	admLugares.agregar(lugar1)
	 	admLugares.agregar(lugar2)
	 	admLugares.agregar(lugar3)
	 	
	 	admLugares.cambiarNombreSiPuedeDelPuntuable(lugar3,"Yona")
	 }
	 
	  
	 /**
	   Verifico si el nombre de un servicio ya esta usado
	  */
	 @Test
	 def testNoHayServicioConElNombreQueSeQuiereUtilizar(){
	 	
	 	var admServicios= new AdmPuntuables()
	 	var servicio1= new Puntuable
	    var servicio2= new Puntuable
	    var servicio3= new Puntuable
	 	admServicios.agregar(servicio1)
	 	admServicios.agregar(servicio2)
	 	admServicios.agregar(servicio3)
	 	servicio1.nombre="Metrogas"
	 	servicio2.nombre="Edesur"
	 	servicio3.nombre="Movistar"
	 	
	 	
	 	admServicios.cambiarNombreSiPuedeDelPuntuable(servicio3,"Edenor")
	 	assertEquals(servicio3.nombre,"Edenor")
	 }
	 
	 
	 
	
}