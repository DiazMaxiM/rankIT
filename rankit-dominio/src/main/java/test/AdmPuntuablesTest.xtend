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
	 def lugaresInscriptos(){
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
	  * Pruebo que al agregar tres servicios al admistrador de 
	  * puntuables, se actualizan los servicios habilitados
	  */
	 @Test
	 def serviciosHabilitados(){
	 	var admServicios= new AdmPuntuables()
	 	var servicio1= new Puntuable
	    var servicio2= new Puntuable
	    var servicio3= new Puntuable
	 	admServicios.agregar(servicio1)
	 	admServicios.agregar(servicio2)
	 	admServicios.agregar(servicio3)
        assertEquals(admServicios.habilitados,0)
	 	
	 }
	 
	 
	 /**
	  * Pruebo que al agregar tres lugares al admisitrador de 
	  * puntuables, se actualizan los lugares Deshabilitados 
	  */
	 @Test 
	 def lugaresDeshabilitados(){
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
	  * puntuables y habilitar dos, se actualizan los lugares habilitados
	  */
	 @Test 
	 def habilitarLugares(){
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
	  * puntuables y habilitar dos, se actualizan los servicios Deshabilitados
	  */
	 @Test
	 def habilitarServiciosYSeActualizanServiciosDeshabilitados(){
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
	 def buscarLugarPorNombre(){
	 	var admLugares= new AdmPuntuables()
	    var lugar1= new Puntuable
	    var lugar2= new Puntuable
	    var lugar3= new Puntuable
	 	admLugares.agregar(lugar1)
	 	admLugares.agregar(lugar2)
	 	admLugares.agregar(lugar3)
	 	
	 	assertEquals(admLugares.buscar("").size,3)
	 	
	 }
	 
	 
	  /**
	  * En este test pruebo que al buscar un lugar por sus letras
	  * me devuelve todos los lugares que contienen las letras ingresadas
	  */
	 @Test 
	 def buscarLugaresPorLetras(){
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
	 	
	 	assertEquals(2,admLugares.buscar("n").size)
	 	assertTrue(admLugares.buscar("n").contains(lugar2))
	 	assertTrue(admLugares.buscar("n").contains(lugar1))
	 	assertFalse(admLugares.buscar("n").contains(lugar3))
	 }
	 
	  /**
	  * Pruebo que cuando busco un servicio que no esta inscripto 
	  * no hay resultados 
	  */
	 @Test 
	 def noHayServicioConElNombre(){
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
	 	
	 	assertEquals(admServicios.buscar("Edenor").size,0)
	 }
	 
	  /**
	  * Prue que al buscar un lugar que no esta inscripto 
	  * no hay resultados 
	  */
	 @Test 
	 def noHayLugaresConLasLetras(){
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
	 	
	 	assertEquals(admLugares.buscar("h").size,0)
	 }
	 
	 /**
	  * Pruebo que cuando pregunto por un nombre que ya esta registrado 
	  * me devulelve una UserException
	  */
	 @Test(expected=UserException )
	 def hayLugaresDuplicados(){
	 	
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
	 	
	 	
	 	admLugares.verificarSiHayDuplicados("Yona")
	 }
	 
	 
	 
	
}