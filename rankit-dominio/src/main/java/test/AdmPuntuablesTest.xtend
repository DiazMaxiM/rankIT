package test
import edu.unq.interfaces.rankit_dominio.AdmPuntuables
import org.junit.Test
import static org.junit.Assert.*;
import edu.unq.interfaces.rankit_dominio.Puntuable
import org.uqbar.commons.model.UserException

class AdmPuntuablesTest {
	
	 /**
	  * En este test pruebo que al agregar tres lugares al admistrador de 
	  * puntuables, se actualizan los lugares inscriptos
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
	  * En este test pruebo que al agregar tres servicios al admistrador de 
	  * puntuables, se actualizan los servicios inscriptos
	  */
	 @Test
	 def serviciosInscriptos(){
	 	var admServicios= new AdmPuntuables()
	 	var servicio1= new Puntuable
	    var servicio2= new Puntuable
	    var servicio3= new Puntuable
	 	admServicios.agregar(servicio1)
	 	admServicios.agregar(servicio2)
	 	admServicios.agregar(servicio3)
        assertEquals(admServicios.inscriptos,3)
	 	
	 }
	 /**
	  * En este test pruebo que al agregar tres lugares al admisitrador de 
	  * puntuables, se actualizan los lugares habilitados 
	  */
	 @Test 
	 def lugaresHabilitados(){
	 	var admLugares= new AdmPuntuables()
	 	var lugar1= new Puntuable
	    var lugar2= new Puntuable
	    var lugar3= new Puntuable
	 	admLugares.agregar(lugar1)
	 	admLugares.agregar(lugar2)
	 	admLugares.agregar(lugar3)
        assertEquals(admLugares.habilitados,0)
	 	
	 }
	 
	  /**
	  * En este test pruebo que al agregar tres servicios al admistrador de 
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
	  * En este test pruebo que al agregar tres lugares al admisitrador de 
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
	  * En este test pruebo que al agregar tres servicios al admistrador de 
	  * puntuables, se actualizan los servicios Deshabilitados
	  */
	 @Test
	 def serviciosDeshabilitados(){
	 	var admServicios= new AdmPuntuables()
	 	var servicio1= new Puntuable
	    var servicio2= new Puntuable
	    var servicio3= new Puntuable
	 	admServicios.agregar(servicio1)
	 	admServicios.agregar(servicio2)
	 	admServicios.agregar(servicio3)
        assertEquals(admServicios.deshabilitados,3)
	 	
	 }
	 
	 /**
	  * En este test pruebo que al agregar tres lugares al admisitrador de 
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
	 	lugar1.habilitado=true
	 	lugar3.habilitado=true
        assertEquals(admLugares.habilitados,2)
	 	
	 }
	 
	  /**
	  * En este test pruebo que al agregar tres servicios al admistrador de 
	  * puntuables y habilitar dos, se actualizan los servicios habilitados
	  */
	 @Test
	 def habilitarServicios(){
	 	var admServicios= new AdmPuntuables()
	    var servicio1= new Puntuable
	    var servicio2= new Puntuable
	    var servicio3= new Puntuable
	 	admServicios.agregar(servicio1)
	 	admServicios.agregar(servicio2)
	 	admServicios.agregar(servicio3)
	 	servicio1.habilitado=true
	 	servicio3.habilitado=true
        assertEquals(admServicios.habilitados,2)
	 	
	 }
	 
	  /**
	  * En este test pruebo que al agregar tres lugares al admisitrador de 
	  * puntuables y habilitar dos, se actualizan los lugares Deshabilitados
	  */
	 @Test 
	 def habilitarLugaresYSeActualizaLosLugaresDeshabilitados(){
	 	var admLugares= new AdmPuntuables()
	 	var lugar1= new Puntuable
	    var lugar2= new Puntuable
	    var lugar3= new Puntuable
	 	admLugares.agregar(lugar1)
	 	admLugares.agregar(lugar2)
	 	admLugares.agregar(lugar3)
	 	lugar1.habilitado=true
	 	lugar3.habilitado=true
        assertEquals(admLugares.deshabilitados,1)
	 	
	 }
	 
	 
	  /**
	  * En este test pruebo que al agregar tres servicios al admistrador de 
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
	 	servicio1.habilitado=true
	 	servicio3.habilitado=true
        assertEquals(admServicios.deshabilitados,1)
	 	
	 }
	 /**
	  * En este test pruebo que al buscar un lugar sin enviarle datos
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
	  * En este test pruebo que al buscar un servicio sin enviarle datos
	  * me devuelve todos los servicios inscriptos
	  */
	 @Test 
	 def buscarServicioPorNombre(){
	    var admServicios= new AdmPuntuables()
	 	var servicio1= new Puntuable
	    var servicio2= new Puntuable
	    var servicio3= new Puntuable
	 	admServicios.agregar(servicio1)
	 	admServicios.agregar(servicio2)
	 	admServicios.agregar(servicio3)
	 	
	 	assertEquals(admServicios.buscar("").size,3)
	 	
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
	 	
	 	assertEquals(admLugares.buscar("n").size,2)
	 	assertTrue(admLugares.buscar("n").contains(lugar2))
	 	assertTrue(admLugares.buscar("n").contains(lugar1))
	 	assertFalse(admLugares.buscar("n").contains(lugar3))
	 }
	 
	 /**
	  * En este test pruebo que al buscar un servicio por sus letras
	  * me devuelve todos los servicios que contienen las letras ingresadas
	  */
	 @Test 
	 def buscarServiciosPorLetras(){
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
	 	
	 	assertEquals(admServicios.buscar("e").size,2)
	 	assertTrue(admServicios.buscar("e").contains(servicio1))
	 	assertTrue(admServicios.buscar("e").contains(servicio2))
	 	assertFalse(admServicios.buscar("e").contains(servicio3))
	 }
	 /**
	  * En este test quiero probar que cuando busco un lugar que no esta inscripto 
	  * no hay resultados 
	  */
	 @Test 
	 def noHayLugarConElNombre(){
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
	 	
	 	assertEquals(admLugares.buscar("Garbarino").size,0)
	 }
	 
	  /**
	  * En este test quiero probar que cuando busco un servicio que no esta inscripto 
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
	  * En este test quiero probar que cuando busco un lugar que no esta inscripto 
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
	  * En este test quiero probar que cuando busco un servicio que no esta inscripto 
	  * no hay resultados 
	  */
	 @Test 
	 def noHayServiciosConElNombre(){
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
	 	
	 	assertEquals(admServicios.buscar("z").size,0)
	 }
	 
	 /**
	  * En este test quiero probar que cuando pregunto por un nombre que ya esta registrado 
	  * tira una excepcion 
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
	 
	 /**
	  * En este test quiero probar que cuando pregunto por un nombre que ya esta registrado 
	  * tira una excepcion 
	  */
	 
	 @Test(expected=UserException)
	 def void hayServiciosDuplicados(){
	 	
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
	 	
	 	admServicios.verificarSiHayDuplicados("Metrogas")
	 	
	 }
	 
	
}