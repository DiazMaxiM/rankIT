package test

import edu.unq.interfaces.rankit_dominio.Calificacion
import edu.unq.interfaces.rankit_dominio.Usuario
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import org.uqbar.commons.model.UserException

import static org.mockito.Mockito.*

/**
 * @author Maximiliano Diaz
 * 
 * Testeo La Clase Calificacion 
 */
class calificacionTest {

	Calificacion miCalificacion = new Calificacion(mock(typeof(Usuario)))

	@Before
	def void SetUp() {
	}

	@Test(expected=UserException)
	def void testSiQuieroSetearUnValorConComaDevuelveUnaException() {
		miCalificacion.puntos = "12,5"
	}

	@Test(expected=UserException)
	def void testSiQuieroSetearUnValorVacioDevuelveUnaException() {
		miCalificacion.puntos = ""
	}

	@Test
	def void testSiQuieroSetearUnValorCorrectoDevuelveEseValor() {
		miCalificacion.puntos = "15"
		Assert.assertEquals(miCalificacion.puntos, 15)
	}

}
