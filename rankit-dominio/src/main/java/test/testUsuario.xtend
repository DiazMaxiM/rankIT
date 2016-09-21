package test

import edu.unq.interfaces.rankit_dominio.Usuario
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class testUsuario
{
	@Before
	def void setUp()
	{
		//val Usuario usuarioNuevo = new Usuario()
	}
	
	@Test
	/**
	 * Dado un usuario, le cambio el nombre por "Liza" y le pregunto si su nombre es igual a "Liza"
	 */
	def testCambiarNombreCasoPositivo()
	{
		val Usuario usuarioNuevo = new Usuario()
		usuarioNuevo.cambiarNombre("Camila")
		Assert.assertEquals("Camila", usuarioNuevo.nombre)
	}
	
	@Test
	/**
	 * Dado un usuario, le cambio el nombre por "Liza" y le pregunto si su nombre es igual a "Camila"
	 */
	def testCambiarNombreCasoNegativo()
	{
		val Usuario usuarioNuevo = new Usuario()
		usuarioNuevo.cambiarNombre("Liza")
		Assert.assertNotEquals("Camila", usuarioNuevo.nombre)
	}
	
	@Test
	/**
	 * Dado un usuario con la contraseña "321" le pregunto si su contraseña es igual a "321"
	 */
	def testCambiarContrasenhaCasoPositivo()
	{
		val Usuario usuarioNuevo = new Usuario()
		usuarioNuevo.cambiarContrasenha("321")
		Assert.assertEquals("321", usuarioNuevo.password)
	}
	
	@Test
	/**
	 * Dado un usuario con la contraseña "321" le pregunto si su contraseña es igual a "789"
	 */
	def testCambiarContrasenhaCasoNegativo()
	{
		val Usuario usuarioNuevo = new Usuario()
		usuarioNuevo.cambiarContrasenha("321")
		Assert.assertNotEquals("789", usuarioNuevo.password)
	}
	
	@Test
	/**
	 * Dado un usuario, lo baneo y pregunto si su baneo es igual a true
	 */
	def testBanearUsuarioCasoPositivo()
	{
		val Usuario usuarioNuevo = new Usuario()
		usuarioNuevo.setBanear(true)
		Assert.assertTrue(usuarioNuevo.baneado == true)
	}
	
	@Test
	/**
	 * Dado un usuario, lo baneo y pregunto si baneo es igual a false
	 */
	def testBanearUsuarioCasoNegativo()
	{
		val Usuario usuarioNuevo = new Usuario()
		usuarioNuevo.setBanear(true)
		Assert.assertFalse(usuarioNuevo.baneado == false)
	}
	
	@Test
	/**
	 * Dado un usuario, lo desbaneo y pregunto si su baneo es igual a false
	 */
	def testDesbanearUsuarioCasoPositivo()
	{
		val Usuario usuarioNuevo = new Usuario()
		usuarioNuevo.desbanearUsuario
		Assert.assertTrue(usuarioNuevo.baneado == false)
	}
	
	@Test
	/**
	 * Dado un usuario, lo desbaneo y pregunto si baneo es igual a true
	 */
	def testDesbanearUsuarioCasoNegativo()
	{
		val Usuario usuarioNuevo = new Usuario()
		usuarioNuevo.desbanearUsuario
		Assert.assertFalse(usuarioNuevo.baneado == true)
	}
	
	@Test
	/**
	 * Dado un usuario con el nombre "Liza" le pregunto si su nombre es igual a "Liza"
	 */
	def testDeNombreCasoPositivo()
	{
		val Usuario usuarioNuevo = new Usuario()
		usuarioNuevo.cambiarNombre("Liza")
		Assert.assertTrue(usuarioNuevo.deNombre("Liza"))
	}
	
	@Test
	/**
	 * Dado un usuario con el nombre "Liza" le pregunto si su nombre es igual a "Camila"
	 */
	def testDeNombreCasoNegativo()
	{
		val Usuario usuarioNuevo = new Usuario()
		usuarioNuevo.cambiarNombre("Liza")
		Assert.assertFalse(usuarioNuevo.deNombre("Camila"))
	}
	
	@Test
	/**
	 * Dado un usuario, lo activo y pregunto si su estado activo es igual a true
	 */
	def testActivarUsuarioCasoPositivo()
	{
		val Usuario usuarioNuevo = new Usuario()
		usuarioNuevo.setActivo(true)
		Assert.assertTrue(usuarioNuevo.activo)
	}
	
	@Test
	/**
	 * Dado un usuario, lo activo y pregunto si su estado activo es igual a false
	 */
	def testActivarUsuarioCasoNegativo()
	{
		val Usuario usuarioNuevo = new Usuario()
		usuarioNuevo.setActivo(true)
		Assert.assertFalse(usuarioNuevo.activo == false)
	}
	
	@Test
	/**
	 * Dado un usuario baneado, le pregunto si esta baneado es igual a True
	 */
	def testEstaBaneadoCasoPositivo()
	{
		val Usuario usuarioNuevo = new Usuario()
		usuarioNuevo.setBaneado(true)
		Assert.assertTrue(usuarioNuevo.estaBaneado == true)
		Assert.assertTrue(usuarioNuevo.activo == false)
	}
	
	@Test
	/**
	 * Dado un usuario sin banear, le pregunto si esta baneado es igual a False
	 */
	def testEstaBaneadoCasoNegativo()
	{
		val Usuario usuarioNuevo = new Usuario()
		usuarioNuevo.setBaneado(false)
		Assert.assertTrue(usuarioNuevo.estaBaneado == false)
	}
	
	@Test
	/**
	 * Dado un usuario inactivo, le pregunto si su estado inactivo es igual a True
	 */
	def testEsInactivoCasoPositivo()
	{
		val Usuario usuarioNuevo = new Usuario()
		usuarioNuevo.inactivarUsuario
		Assert.assertTrue(usuarioNuevo.esInactivo == true)
	}
	
	@Test
	/**
	 * Dado un usuario inactivo, le pregunto si su estado inactivo es igual a False
	 */
	def testEsInactivoCasoNegativo()
	{
		val Usuario usuarioNuevo = new Usuario()
		usuarioNuevo.inactivarUsuario
		Assert.assertFalse(usuarioNuevo.esInactivo == false)
	}
	
		@Test
	/**
	 * Dado un usuario, le blanqueo la contraseña y pregunto si su contraseña esta blanqueada.
	 */
	def testBlanqueoDeContrasenhaCasoPositivo()
	{
		val Usuario usuarioNuevo = new Usuario()
		usuarioNuevo.blanqueoDeContrasenha
		Assert.assertEquals("123", usuarioNuevo.password)
	}
	
	@Test
	/**
	 * Dado un usuario, le blanqueo la contraseña y pregunto si su contraseña no esta blanqueada.
	 */
	def testBlanqueoDeContrasenhaCasoNegativo()
	{
		val Usuario usuarioNuevo = new Usuario()
		usuarioNuevo.blanqueoDeContrasenha
		Assert.assertFalse(usuarioNuevo.password!="123")
	}
	
		@Test
	/**
	 * Dado un usuario, lo inactivo y le pregunto si su estado inactivo es igual a True
	 */
	def testInactivarUsuarioCasoPositivo()
	{
		val Usuario usuarioNuevo = new Usuario()
		usuarioNuevo.inactivarUsuario
		Assert.assertTrue(usuarioNuevo.esInactivo)
	}
	
	@Test
	/**
	 * Dado un usuario, lo inactivo y le pregunto si su estado inactivo es igual a False
	 */
	def testInactivarUsuarioCasoNegativo()
	{
		val Usuario usuarioNuevo = new Usuario()
		usuarioNuevo.inactivarUsuario
		Assert.assertFalse(usuarioNuevo.activo)
	}
	
}