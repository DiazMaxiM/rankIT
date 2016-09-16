package test

import edu.unq.interfaces.rankit_dominio.AdmCalificaciones
import edu.unq.interfaces.rankit_dominio.Calificacion
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import static org.mockito.Mockito.*;
class AdmCalificacionesTest {
	private var AdmCalificaciones admCalificacion

	@Before
	def void SetUp() {
		admCalificacion = new AdmCalificaciones
	}

	@Test 
	def void testSiAgregoCalificacionLaCantidadDeCalificacionesEs1YSiLaRecuperoEsLaMisma(){
		
		val calificacionMock = mock (typeof(Calificacion))
		
		val listaConUnaSolaCalificacion = newArrayList
		listaConUnaSolaCalificacion.add(calificacionMock)
		
		admCalificacion.agregarCalificacion(calificacionMock)
		
		Assert.assertEquals(admCalificacion.calificacionesRegistradas,1)
		Assert.assertEquals(admCalificacion.listaCalificaciones,listaConUnaSolaCalificacion)
		
	}@Test 
	def void testSiAgregoUnaListaDeCalificacionesAlAdmCalificacionesDeberaTenerMismoSizeYMismosElementos(){
		
		val calificacionMock = mock (typeof(Calificacion))
		
		val listaConUnaSolaCalificacion = newArrayList
		listaConUnaSolaCalificacion.add(calificacionMock)
		
		admCalificacion.agregarTodasLasCalificaciones(listaConUnaSolaCalificacion)
		
		Assert.assertEquals(admCalificacion.calificacionesRegistradas,listaConUnaSolaCalificacion.size)
		Assert.assertEquals(admCalificacion.listaCalificaciones,listaConUnaSolaCalificacion)
		
	}
	@Test 
	def void testSiAgregoUnaCalificacionAlAdmCalificacionesYLaEliminoNoDeberiaTenerCalificaciones(){
		
		val calificacionMock = mock (typeof(Calificacion))
		
		admCalificacion.agregarCalificacion(calificacionMock)
		
		Assert.assertEquals(admCalificacion.calificacionesRegistradas,1)
		
		admCalificacion.eliminarCalificacion(calificacionMock)
		
		Assert.assertEquals(admCalificacion.calificacionesRegistradas,0)
	}
	@Test 
	def void testSiAgregoDosCalificacionesYUnaDeEllasEsOfensivaDebeDevolverDosTotalesYUnaOfensivaYVerificarQueLasMismasSeanLasOriginales(){
		
		val calificacionOfensivaMock = mock (typeof(Calificacion))
		when(calificacionOfensivaMock.contenidoOfensivo).thenReturn(true);
		val calificacionMock = mock (typeof(Calificacion))
		when(calificacionMock.contenidoOfensivo).thenReturn(false);
		
		admCalificacion.agregarCalificacion(calificacionMock)
		admCalificacion.agregarCalificacion(calificacionOfensivaMock)
		
		Assert.assertEquals(admCalificacion.calificacionesRegistradas,2)
		
		Assert.assertEquals(admCalificacion.calificacionesOfensivas,1)
	}
//	
//	
//	/**
//	 * En este test quiero probar que el lugar 1 tiene 2 califiacaciones
//	 *
//	 */
//	@Test 
//	def calificacionesDelPuntuable(){
//		// los Puntuables 
//	 	var lugar1= new Lugar
//	    var lugar2= new Lugar
//	    var lugar3= new Lugar
//	    lugar3.nombre="Fravega"
//	    lugar2.nombre="Yona"
//	    lugar1.nombre="San Cayetano"
//	    var servicio1= new Servicio
//	    var servicio2= new Servicio
//	    var servicio3= new Servicio
//	    servicio1.nombre="Metrogas"
//	 	servicio2.nombre="Edesur"
//	 	servicio3.nombre="Movistar"
//		// creo y modifico las calificaciones
//		var admCalificaciones= new AdmCalificaciones
//	 	var calificacion1= new Calificacion
//	 	var calificacion2= new Calificacion
//	 	var calificacion3= new Calificacion
//	 	var calificacion4= new Calificacion
//	 	var calificacion5= new Calificacion 
//	 	calificacion1.evaluado = servicio1
//	 	calificacion2.evaluado=lugar1
//	 	calificacion3.evaluado=servicio2
//	 	calificacion4.evaluado=lugar1
//	 	calificacion5.evaluado=lugar2
//	 	// agrego las calificaciones a una lista 
//	 	var List<Calificacion>calificaciones=new ArrayList
//	 	calificaciones.add(calificacion1)
//	 	calificaciones.add(calificacion2)
//	 	calificaciones.add(calificacion3)
//	 	calificaciones.add(calificacion4)
//	 	calificaciones.add(calificacion5)
//	 	//agrego todas las calificaciones al admistrador
//	 	admCalificaciones.agregarTodasLasCalificaciones(calificaciones)
//	 	
//	 	assertEquals(2,admCalificaciones.cantidadDeCalificacionesDelPuntuable(lugar1))
//	 			
//	}
//	/**En este test quiero probar que el rating promedio de un puntuable es 50 */
//	@Test 
//	def elRatingPromedioDeUnPuntuableEs50(){
//		var lugar1= new Lugar
//	    var lugar2= new Lugar
//	    lugar2.nombre="Yona"
//	    lugar1.nombre="San Cayetano"
//	    var servicio1= new Servicio
//	    servicio1.nombre="Metrogas"
//		// creo y modifico las calificaciones
//		var admCalificaciones= new AdmCalificaciones
//	 	var calificacion1= new Calificacion
//	 	var calificacion2= new Calificacion
//	 	var calificacion3= new Calificacion
//	 	var calificacion4= new Calificacion
//	 	var calificacion5= new Calificacion 
//	 	//Calificacion1
//	    calificacion1.evaluado=lugar1
//	    calificacion1.puntos=50
//	    //Calificacion2
//	    calificacion2.evaluado=lugar2
//	    calificacion2.puntos=4
//	    //Calificacion3
//	    calificacion3.evaluado=servicio1
//	    calificacion3.puntos=10
//	    //Calificacion4
//	    calificacion4.evaluado=lugar2
//	    calificacion4.puntos=40
//	    //Calificacio5
//	    calificacion5.evaluado=lugar1
//	    calificacion5.puntos=50
//	 	// agrego las calificaciones a una lista 
//	 	var List<Calificacion>calificaciones=new ArrayList
//	 	calificaciones.add(calificacion1)
//	 	calificaciones.add(calificacion2)
//	 	calificaciones.add(calificacion3)
//	 	calificaciones.add(calificacion4)
//	 	calificaciones.add(calificacion5)
//	 	//agrego todas las calificaciones al admistrador
//	 	admCalificaciones.agregarTodasLasCalificaciones(calificaciones)
//	 	
//		assertEquals(50,admCalificaciones.ratingPromedio(lugar1))
//	 	}
//	 	
//	    @Test
//	 	def elRatingPromedioDeUnPuntuableSinCalificacionesEs0(){
//	 	var lugar1= new Lugar
//	    var lugar2= new Lugar
//	    lugar2.nombre="Yona"
//	    lugar1.nombre="San Cayetano"
//	    var servicio1= new Servicio
//	    servicio1.nombre="Metrogas"
//		// creo y modifico las calificaciones
//		var admCalificaciones= new AdmCalificaciones
//	 	var calificacion1= new Calificacion
//	 	var calificacion2= new Calificacion
//	 	var calificacion3= new Calificacion
//	 	var calificacion4= new Calificacion
//	 	var calificacion5= new Calificacion 
//	 	//Calificacion1
//	    calificacion1.evaluado=lugar1
//	    calificacion1.puntos=50
//	    //Calificacion2
//	    calificacion2.evaluado=lugar1
//	    calificacion2.puntos=4
//	    //Calificacion3
//	    calificacion3.evaluado=servicio1
//	    calificacion3.puntos=10
//	    //Calificacion4
//	    calificacion4.evaluado=lugar1
//	    calificacion4.puntos=40
//	    //Calificacio5
//	    calificacion5.evaluado=lugar1
//	    calificacion5.puntos=50
//	 	// agrego las calificaciones a una lista 
//	 	var List<Calificacion>calificaciones=new ArrayList
//	 	calificaciones.add(calificacion1)
//	 	calificaciones.add(calificacion2)
//	 	calificaciones.add(calificacion3)
//	 	calificaciones.add(calificacion4)
//	 	calificaciones.add(calificacion5)
//	 	//agrego todas las calificaciones al admistrador
//	 	admCalificaciones.agregarTodasLasCalificaciones(calificaciones)
//	 	  assertEquals(0,admCalificaciones.ratingPromedio(lugar2))
//	 	}
}
