package test
import edu.unq.interfaces.rankit_dominio.AdmPuntuables
import org.junit.Test
import static org.junit.Assert.*;
import edu.unq.interfaces.rankit_dominio.Puntuable

class AdmPuntuablesTest {
	
	 /**
	  * En este test pruebo que al agregar tres lugares al admistrador de 
	  * puntuables, se actualizan los lugares inscriptos
	  */
	 @Test
	 def lugaresInscriptos(){
	 	var admPuntuables= new AdmPuntuables()
	 	var lugar1= new Puntuable
	    var lugar2= new Puntuable
	    var lugar3= new Puntuable
	 	admPuntuables.agregarLugar(lugar1)
	 	admPuntuables.agregarLugar(lugar2)
	 	admPuntuables.agregarLugar(lugar3)
        assertEquals(admPuntuables.lugaresInscriptos,3)
	 	
	 }
	 
	 /**
	  * En este test pruebo que al agregar tres servicios al admistrador de 
	  * puntuables, se actualizan los servicios inscriptos
	  */
	 @Test
	 def serviciosInscriptos(){
	 	var admPuntuables= new AdmPuntuables()
	 	var servicio1= new Puntuable
	    var servicio2= new Puntuable
	    var servicio3= new Puntuable
	 	admPuntuables.agregarServicio(servicio1)
	 	admPuntuables.agregarServicio(servicio2)
	 	admPuntuables.agregarServicio(servicio3)
        assertEquals(admPuntuables.serviciosInscriptos,3)
	 	
	 }
	 /**
	  * En este test pruebo que al agregar tres lugares al admisitrador de 
	  * puntuables, se actualizan los lugares habilitados 
	  */
	 @Test 
	 def lugaresHabilitados(){
	 	var admPuntuables= new AdmPuntuables()
	 	var lugar1= new Puntuable
	    var lugar2= new Puntuable
	    var lugar3= new Puntuable
	 	admPuntuables.agregarLugar(lugar1)
	 	admPuntuables.agregarLugar(lugar2)
	 	admPuntuables.agregarLugar(lugar3)
        assertEquals(admPuntuables.lugaresHabilitados,0)
	 	
	 }
	 
	  /**
	  * En este test pruebo que al agregar tres servicios al admistrador de 
	  * puntuables, se actualizan los servicios habilitados
	  */
	 @Test
	 def serviciosHabilitados(){
	 	var admPuntuables= new AdmPuntuables()
	 	var servicio1= new Puntuable
	    var servicio2= new Puntuable
	    var servicio3= new Puntuable
	 	admPuntuables.agregarServicio(servicio1)
	 	admPuntuables.agregarServicio(servicio2)
	 	admPuntuables.agregarServicio(servicio3)
        assertEquals(admPuntuables.serviciosHabilitados,0)
	 	
	 }
	 
	 
	 /**
	  * En este test pruebo que al agregar tres lugares al admisitrador de 
	  * puntuables, se actualizan los lugares Deshabilitados 
	  */
	 @Test 
	 def lugaresDeshabilitados(){
	 	var admPuntuables= new AdmPuntuables()
	 	var lugar1= new Puntuable
	    var lugar2= new Puntuable
	    var lugar3= new Puntuable
	 	admPuntuables.agregarLugar(lugar1)
	 	admPuntuables.agregarLugar(lugar2)
	 	admPuntuables.agregarLugar(lugar3)
        assertEquals(admPuntuables.lugaresDeshabilitados,3)
	 	
	 }
	 
	  /**
	  * En este test pruebo que al agregar tres servicios al admistrador de 
	  * puntuables, se actualizan los servicios Deshabilitados
	  */
	 @Test
	 def serviciosDeshabilitados(){
	 	var admPuntuables= new AdmPuntuables()
	 	var servicio1= new Puntuable
	    var servicio2= new Puntuable
	    var servicio3= new Puntuable
	 	admPuntuables.agregarServicio(servicio1)
	 	admPuntuables.agregarServicio(servicio2)
	 	admPuntuables.agregarServicio(servicio3)
        assertEquals(admPuntuables.serviciosDeshabilitados,3)
	 	
	 }
	 
	 /**
	  * En este test pruebo que al agregar tres lugares al admisitrador de 
	  * puntuables y habilitar dos, se actualizan los lugares habilitados
	  */
	 @Test 
	 def habilitarLugares(){
	 	var admPuntuables= new AdmPuntuables()
	 	var lugar1= new Puntuable
	    var lugar2= new Puntuable
	    var lugar3= new Puntuable
	 	admPuntuables.agregarLugar(lugar1)
	 	admPuntuables.agregarLugar(lugar2)
	 	admPuntuables.agregarLugar(lugar3)
	 	lugar1.habilitado=true
	 	lugar3.habilitado=true
        assertEquals(admPuntuables.lugaresHabilitados,2)
	 	
	 }
	 
	  /**
	  * En este test pruebo que al agregar tres servicios al admistrador de 
	  * puntuables y habilitar dos, se actualizan los servicios habilitados
	  */
	 @Test
	 def habilitarServicios(){
	 	var admPuntuables= new AdmPuntuables()
	    var servicio1= new Puntuable
	    var servicio2= new Puntuable
	    var servicio3= new Puntuable
	 	admPuntuables.agregarServicio(servicio1)
	 	admPuntuables.agregarServicio(servicio2)
	 	admPuntuables.agregarServicio(servicio3)
	 	servicio1.habilitado=true
	 	servicio3.habilitado=true
        assertEquals(admPuntuables.serviciosHabilitados,2)
	 	
	 }
	 
	  /**
	  * En este test pruebo que al agregar tres lugares al admisitrador de 
	  * puntuables y habilitar dos, se actualizan los lugares Deshabilitados
	  */
	 @Test 
	 def habilitarLugaresYSeActualizaLosLugaresDeshabilitados(){
	 	var admPuntuables= new AdmPuntuables()
	 	var lugar1= new Puntuable
	    var lugar2= new Puntuable
	    var lugar3= new Puntuable
	 	admPuntuables.agregarLugar(lugar1)
	 	admPuntuables.agregarLugar(lugar2)
	 	admPuntuables.agregarLugar(lugar3)
	 	lugar1.habilitado=true
	 	lugar3.habilitado=true
        assertEquals(admPuntuables.lugaresDeshabilitados,1)
	 	
	 }
	 
	 
	  /**
	  * En este test pruebo que al agregar tres servicios al admistrador de 
	  * puntuables y habilitar dos, se actualizan los servicios Deshabilitados
	  */
	 @Test
	 def habilitarServiciosYSeActualizanServiciosDeshabilitados(){
	 	var admPuntuables= new AdmPuntuables()
	    var servicio1= new Puntuable
	    var servicio2= new Puntuable
	    var servicio3= new Puntuable
	 	admPuntuables.agregarServicio(servicio1)
	 	admPuntuables.agregarServicio(servicio2)
	 	admPuntuables.agregarServicio(servicio3)
	 	servicio1.habilitado=true
	 	servicio3.habilitado=true
        assertEquals(admPuntuables.serviciosDeshabilitados,1)
	 	
	 }
	 /**
	  * En este test pruebo que al buscar un lugar sin enviarle datos
	  * me devuelve todos los lugares inscriptos
	  */
	 @Test 
	 def buscarLugarPorNombre(){
	 	var admPuntuables= new AdmPuntuables()
	    var lugar1= new Puntuable
	    var lugar2= new Puntuable
	    var lugar3= new Puntuable
	 	admPuntuables.agregarLugar(lugar1)
	 	admPuntuables.agregarLugar(lugar2)
	 	admPuntuables.agregarLugar(lugar3)
	 	
	 	assertEquals(admPuntuables.buscarLugares("").size,3)
	 	
	 }
	 
	 /**
	  * En este test pruebo que al buscar un servicio sin enviarle datos
	  * me devuelve todos los servicios inscriptos
	  */
	 @Test 
	 def buscarServicioPorNombre(){
	    var admPuntuables= new AdmPuntuables()
	 	var servicio1= new Puntuable
	    var servicio2= new Puntuable
	    var servicio3= new Puntuable
	 	admPuntuables.agregarServicio(servicio1)
	 	admPuntuables.agregarServicio(servicio2)
	 	admPuntuables.agregarServicio(servicio3)
	 	
	 	assertEquals(admPuntuables.buscarServicios("").size,3)
	 	
	 }
	 
	 	 /**
	  * En este test pruebo que al buscar un lugar por sus letras
	  * me devuelve todos los lugares que contienen las letras ingresadas
	  */
	 @Test 
	 def buscarLugaresPorLetras(){
	 	var admPuntuables= new AdmPuntuables()
	 	var lugar1= new Puntuable
	    var lugar2= new Puntuable
	    var lugar3= new Puntuable
	    lugar3.nombre="Fravega"
	    lugar2.nombre="Yona"
	    lugar1.nombre="San Cayetano"
	 	admPuntuables.agregarLugar(lugar1)
	 	admPuntuables.agregarLugar(lugar2)
	 	admPuntuables.agregarLugar(lugar3)
	 	
	 	assertEquals(admPuntuables.buscarLugares("n").size,2)
	 	assertTrue(admPuntuables.buscarLugares("n").contains(lugar2))
	 	assertTrue(admPuntuables.buscarLugares("n").contains(lugar1))
	 	assertFalse(admPuntuables.buscarLugares("n").contains(lugar3))
	 }
	 
	 /**
	  * En este test pruebo que al buscar un servicio por sus letras
	  * me devuelve todos los servicios que contienen las letras ingresadas
	  */
	 @Test 
	 def buscarServiciosPorLetras(){
	    var admPuntuables= new AdmPuntuables()
	 	var servicio1= new Puntuable
	    var servicio2= new Puntuable
	    var servicio3= new Puntuable
	 	admPuntuables.agregarServicio(servicio1)
	 	admPuntuables.agregarServicio(servicio2)
	 	admPuntuables.agregarServicio(servicio3)
	 	servicio1.nombre="Metrogas"
	 	servicio2.nombre="Edesur"
	 	servicio3.nombre="Movistar"
	 	
	 	assertEquals(admPuntuables.buscarServicios("e").size,2)
	 	assertTrue(admPuntuables.buscarServicios("e").contains(servicio1))
	 	assertTrue(admPuntuables.buscarServicios("e").contains(servicio2))
	 	assertFalse(admPuntuables.buscarServicios("e").contains(servicio3))
	 }
	 /**
	  * En este test quiero probar que cuando busco un lugar que no esta inscripto 
	  * no hay resultados 
	  */
	 @Test 
	 def noHayLugarConElNombre(){
	 	var admPuntuables= new AdmPuntuables()
	 	var lugar1= new Puntuable
	    var lugar2= new Puntuable
	    var lugar3= new Puntuable
	    lugar3.nombre="Fravega"
	    lugar2.nombre="Yona"
	    lugar1.nombre="San Cayetano"
	 	admPuntuables.agregarLugar(lugar1)
	 	admPuntuables.agregarLugar(lugar2)
	 	admPuntuables.agregarLugar(lugar3)
	 	
	 	assertEquals(admPuntuables.buscarLugares("Garbarino").size,0)
	 }
	 
	  /**
	  * En este test quiero probar que cuando busco un servicio que no esta inscripto 
	  * no hay resultados 
	  */
	 @Test 
	 def noHayServicioConElNombre(){
	 	var admPuntuables= new AdmPuntuables()
	 	var servicio1= new Puntuable
	    var servicio2= new Puntuable
	    var servicio3= new Puntuable
	 	admPuntuables.agregarServicio(servicio1)
	 	admPuntuables.agregarServicio(servicio2)
	 	admPuntuables.agregarServicio(servicio3)
	 	servicio1.nombre="Metrogas"
	 	servicio2.nombre="Edesur"
	 	servicio3.nombre="Movistar"
	 	
	 	assertEquals(admPuntuables.buscarServicios("Edenor").size,0)
	 }
	 
	  /**
	  * En este test quiero probar que cuando busco un lugar que no esta inscripto 
	  * no hay resultados 
	  */
	 @Test 
	 def noHayLugaresConLasLetras(){
	 	var admPuntuables= new AdmPuntuables()
	 	var lugar1= new Puntuable
	    var lugar2= new Puntuable
	    var lugar3= new Puntuable
	    lugar3.nombre="Fravega"
	    lugar2.nombre="Yona"
	    lugar1.nombre="San Cayetano"
	 	admPuntuables.agregarLugar(lugar1)
	 	admPuntuables.agregarLugar(lugar2)
	 	admPuntuables.agregarLugar(lugar3)
	 	
	 	assertEquals(admPuntuables.buscarLugares("h").size,0)
	 }
	 
	   /**
	  * En este test quiero probar que cuando busco un servicio que no esta inscripto 
	  * no hay resultados 
	  */
	 @Test 
	 def noHayServiciosConElNombre(){
	 	var admPuntuables= new AdmPuntuables()
        var servicio1= new Puntuable
	    var servicio2= new Puntuable
	    var servicio3= new Puntuable
	 	admPuntuables.agregarServicio(servicio1)
	 	admPuntuables.agregarServicio(servicio2)
	 	admPuntuables.agregarServicio(servicio3)
	 	servicio1.nombre="Metrogas"
	 	servicio2.nombre="Edesur"
	 	servicio3.nombre="Movistar"
	 	
	 	assertEquals(admPuntuables.buscarServicios("z").size,0)
	 }
	 
	 /**
	  * En este test quiero probar que cuando pregunto por un nombre que ya esta registrado 
	  * tira una excepcion 
	  */
	 @Test 
	 def hayLugaresDuplicados(){
	 	
	 	var admPuntuables= new AdmPuntuables()
	 	var lugar1= new Puntuable
	    var lugar2= new Puntuable
	    var lugar3= new Puntuable
	    lugar3.nombre="Fravega"
	    lugar2.nombre="Yona"
	    lugar1.nombre="San Cayetano"
	 	admPuntuables.agregarLugar(lugar1)
	 	admPuntuables.agregarLugar(lugar2)
	 	admPuntuables.agregarLugar(lugar3)
	 	// hay que tirar una excepcion 
	 	
	 }
	 
	 /**
	  * En este test quiero probar que cuando pregunto por un nombre que ya esta registrado 
	  * tira una excepcion 
	  */
	 
	 @Test 
	 def hayServiciosDupplicados(){
	 	
	 	var admPuntuables= new AdmPuntuables()
	 	var servicio1= new Puntuable
	    var servicio2= new Puntuable
	    var servicio3= new Puntuable
	 	admPuntuables.agregarServicio(servicio1)
	 	admPuntuables.agregarServicio(servicio2)
	 	admPuntuables.agregarServicio(servicio3)
	 	servicio1.nombre="Metrogas"
	 	servicio2.nombre="Edesur"
	 	servicio3.nombre="Movistar"
	 	// hay que tirar una excepcion
	 	
	 }
	 
	
}