package test

import edu.unq.interfaces.rankit_dominio.AdmCalificaciones
import edu.unq.interfaces.rankit_dominio.Calificacion
import edu.unq.interfaces.rankit_dominio.Puntuable
import edu.unq.interfaces.rankit_dominio.Usuario
import org.junit.Assert
import org.junit.Before
import org.junit.Test

import static org.mockito.Mockito.*

/**
 * @author Maximiliano Diaz
 * 
 * Testeo La Clase AdmCalificaciones usan Mocks para simular los demas objetos que intervienen
 */
class AdmCalificacionesTest {
	private var AdmCalificaciones admCalificacion

	val calificacionMock1 = mock(typeof(Calificacion))
	val calificacionMock2 = mock(typeof(Calificacion))
	val calificacionMock3 = mock(typeof(Calificacion))
	val calificacionMock4 = mock(typeof(Calificacion))
	val calificacionMock5 = mock(typeof(Calificacion))
	val calificacionMock6 = mock(typeof(Calificacion))
	var lugar1 = mock(typeof(Puntuable))
	var lugar2 = mock(typeof(Puntuable))
	var lugar3 = mock(typeof(Puntuable))
	var servicio1 = mock(typeof(Puntuable))
	var servicio2 = mock(typeof(Puntuable))
	var servicio3 = mock(typeof(Puntuable))
	val usuarioMock = mock(typeof(Usuario))

	@Before
	def void SetUp() {
		admCalificacion = new AdmCalificaciones
		when(usuarioMock.nombre).thenReturn("Maxi");

		when(lugar1.nombre).thenReturn("San Cayetano");
		when(lugar2.nombre).thenReturn("Yona");
		when(lugar3.nombre).thenReturn("Fravega");

	
		when(calificacionMock1.puntos).thenReturn(15);
		when(calificacionMock2.puntos).thenReturn(45);

		when(calificacionMock1.evaluado).thenReturn(lugar1);
		when(calificacionMock2.evaluado).thenReturn(lugar1);
		when(calificacionMock3.evaluado).thenReturn(lugar3);

		when(calificacionMock4.evaluado).thenReturn(servicio1);
		when(calificacionMock5.evaluado).thenReturn(servicio2);
		when(calificacionMock6.evaluado).thenReturn(servicio3);

		when(servicio1.nombre).thenReturn("Metrogas");
		when(servicio2.nombre).thenReturn("Edesur");
		when(servicio3.nombre).thenReturn("Movistar");

		when(calificacionMock1.isContenidoOfensivo).thenReturn(true);
		when(calificacionMock2.isContenidoOfensivo).thenReturn(true);
		when(calificacionMock3.isContenidoOfensivo).thenReturn(true);
		when(calificacionMock4.isContenidoOfensivo).thenReturn(true);
		when(calificacionMock5.isContenidoOfensivo).thenReturn(true);
		when(calificacionMock6.isContenidoOfensivo).thenReturn(true);

		when(calificacionMock1.usuario).thenReturn(usuarioMock);
		when(calificacionMock2.usuario).thenReturn(usuarioMock);
		when(calificacionMock3.usuario).thenReturn(usuarioMock);
		when(calificacionMock4.usuario).thenReturn(usuarioMock);
		when(calificacionMock5.usuario).thenReturn(usuarioMock);
		when(calificacionMock6.usuario).thenReturn(usuarioMock);

	}

	private def void agregar6CalificacionesMockOfensivas() {
		admCalificacion.agregarCalificacion(calificacionMock1)
		admCalificacion.agregarCalificacion(calificacionMock2)
		admCalificacion.agregarCalificacion(calificacionMock3)
		admCalificacion.agregarCalificacion(calificacionMock4)
		admCalificacion.agregarCalificacion(calificacionMock5)
		admCalificacion.agregarCalificacion(calificacionMock6)
	}

	@Test
	def void testSiAgregoUnaCalificacionAlAdmCalificacionesYLaEliminoNoDeberiaTenerCalificaciones() {

		Assert.assertEquals(admCalificacion.calificacionesRegistradas, 0)

		admCalificacion.agregarCalificacion(calificacionMock1)

		Assert.assertEquals(admCalificacion.calificacionesRegistradas, 1)

		admCalificacion.eliminarCalificacion(calificacionMock1)

		Assert.assertEquals(admCalificacion.calificacionesRegistradas,
			0)
	}

	@Test
	def void testSiAgregoDosCalificacionesYUnaDeEllasEsOfensivaDebeDevolverDosTotalesYUnaOfensivaYVerificarQueLasMismasSeanLasOriginales() {

		val calificacionOfensivaMock = mock(typeof(Calificacion))
		when(calificacionOfensivaMock.contenidoOfensivo).thenReturn(true);
		val calificacionMock = mock(typeof(Calificacion))
		when(calificacionMock.contenidoOfensivo).thenReturn(false);

		admCalificacion.agregarCalificacion(calificacionMock)
		admCalificacion.agregarCalificacion(calificacionOfensivaMock)

		Assert.assertEquals(admCalificacion.calificacionesRegistradas, 2)

		Assert.assertEquals(admCalificacion.calificacionesOfensivas, 1)
	}

	@Test
	def void testSiAUnUsuarioCon6CalificacionesLesPasoTodasSusCalificacionesAOfensivasElUsuarioQuedaBaneado() {

		agregar6CalificacionesMockOfensivas()

		admCalificacion.contenidoOfensivo(calificacionMock6, true)

		verify(calificacionMock6).contenidoOfensivo = true
		verify(usuarioMock).baneado = true

	}

	/**
	 * En este test quiero probar que el lugar 1 tiene 2 califiacaciones
	 * 
	 */
	@Test
	def testSiTengoDosCalificacionesDeUnLugarYConsultoLaCantidadDeCalificacionesDeEseLugarDevuelve2() {

		agregar6CalificacionesMockOfensivas()

		Assert.assertEquals(2, admCalificacion.cantidadDeCalificacionesDelPuntuable(lugar1))

	}

	@Test
	def testSiQuieroSaberElPromedioDeDosCalificacionesDe15Y45PuntosDevuelve30() {

		agregar6CalificacionesMockOfensivas()

		Assert.assertEquals(30, admCalificacion.ratingPromedio(lugar1))

	}

	@Test
	def void testSiAgregoCalificacionLaCantidadDeCalificacionesEs1YSiLaRecuperoEsLaMisma() {

		val calificacionMock = mock(typeof(Calificacion))

		val listaConUnaSolaCalificacion = newArrayList
		listaConUnaSolaCalificacion.add(calificacionMock)

		admCalificacion.agregarCalificacion(calificacionMock)

		Assert.assertEquals(admCalificacion.calificacionesRegistradas, 1)
		Assert.assertEquals(admCalificacion.listaCalificaciones, listaConUnaSolaCalificacion)

	}

	@Test
	def void testSiAgregoUnaListaDeCalificacionesAlAdmCalificacionesDeberaTenerMismoSizeYMismosElementos() {

		val calificacionMock = mock(typeof(Calificacion))

		val listaConUnaSolaCalificacion = newArrayList
		listaConUnaSolaCalificacion.add(calificacionMock)

		admCalificacion.listaCalificaciones = listaConUnaSolaCalificacion

		Assert.assertEquals(admCalificacion.calificacionesRegistradas, listaConUnaSolaCalificacion.size)
		Assert.assertEquals(admCalificacion.listaCalificaciones, listaConUnaSolaCalificacion)

	}
}
