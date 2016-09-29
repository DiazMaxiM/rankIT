package test

import edu.unq.interfaces.rankit_dominio.Puntuable
import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*;
import org.uqbar.commons.model.UserException
import edu.unq.interfaces.rankit_dominio.PuntuableNull

class PuntuableTest {
	    var Puntuable lugar1
	    var Puntuable lugar2
	    var Puntuable lugar3
	    var Puntuable servicio1
	    var Puntuable servicio2
	    var Puntuable servicio3
	    
	 @Before 
	 def void setUp(){
	 	 lugar1=new Puntuable
	 	 lugar2=new Puntuable
	 	 lugar3=new Puntuable
	 	 servicio2=new Puntuable
	 	 servicio3=new Puntuable
	 }
	 /** Verifico si un servicio tiene nombre 
	  * 
	  * */
	 
	 @Test(expected=UserException)
	 def void testUnServicioCreadoNoTieneNombre(){
	 	servicio1=new Puntuable
	    servicio1.validarSiElPuntuableTieneNombre
	 	
	 }
	 
	 /**
	  * Verifico si un  tiene nomre 
	  */
	  
	  @Test
	  def lugarConNombreAsignado(){
	  	 lugar2.nombre="Yona"
	  	 lugar2.validarSiElPuntuableTieneNombre
	  }
	 
	 
	 @Test
	 /**
	  * Verifico si al cambiarle el nombre a un lugar se actualiza 
	  * el nombre con el nuevo nombre
	  *
	  */
	  def testCambioDeNombreAUnLugar(){
	  	 lugar1.nombre="Freddo"
	  	 assertTrue(lugar1.tieneElNombre("Freddo"))
	
	  }
	    
	 @Test
	 /**
	  * Verifico si al cambiarle el nombre a un servicio 
	  * se actualiza el nombre con el nuevo nombre 
	  */
	  def testUnServicioNoTieneElNombreMetrogas(){
	  	servicio3.nombre="Edesur"
	  	assertFalse(servicio3.tieneElNombre("Edenor"))
	  }

	  /**
	   * Verifico si un lugar es igual a otro lugar 
	   */
	  @Test 
	  def testPrueboSiUnPuntuablesEsIgualAOtro(){
	  	  lugar1.nombre="Yona"
	  	  assertTrue(lugar1.esIgualA(lugar1))
	  }
	  
	  /**
	   * Verifico si un servicio es igual a otro servicio 
	   */
	  @Test
	  def testPrueboQueUnPuntuableNoEsIgualAOtro(){
	  	assertFalse(servicio2.esIgualA(new PuntuableNull))
	  }
	  
	   /**
	    * Verifico que cuando habilito un lugar este queda hanilitado
	    */ 
	  @Test
	  def testHabilitoUnLugar(){
	  	  lugar2.habilitado = true
	  	  assertTrue(lugar2.habilitado)
	  }
	  
	  /**
	   * Verifico que cuando deshabilito un servicio este queda deshabilitado
	   */
	  @Test
	  def testDeshabilitoUnServicio(){
	  	  servicio3.habilitado=false
	  	  assertFalse(servicio3.habilitado)
	  }
	  

}