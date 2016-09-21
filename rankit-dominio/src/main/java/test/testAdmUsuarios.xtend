package test

import edu.unq.interfaces.rankit_dominio.AdmUsuarios
import edu.unq.interfaces.rankit_dominio.Usuario
import org.junit.Assert
import org.junit.Before
import org.junit.Test

import static org.mockito.Mockito.*
import java.util.List
import java.util.ArrayList

class testAdmUsuarios 
{
	@Before
	def void setUp()
	{
		
	}
	
	@Test
	/**
	 * Dado un AdmUsuarios sin usuarios, pregunto si no tiene usuarios
	 */
	def void testAdmUsuariosNuevoCasoPositivo()
	{
		var AdmUsuarios administrador = new AdmUsuarios()
		Assert.assertTrue(administrador.usuarios.empty)
	}
	
	@Test
	/**
	 * Dado un AdmUsuarios, le agrego un usuario y pregunto si lo agrego
	 */
	def void testAgregarUsuarioNuevoCasoPositivo()
	{
		var AdmUsuarios administrador = new AdmUsuarios()
		var Usuario usuarioMock = mock(Usuario)
		
		administrador.agregarUsuarioNuevo(usuarioMock)
		Assert.assertTrue(administrador.usuarios.contains(usuarioMock))
	}
	
	@Test
	/**
	 * Dado un AdmUsuarios con 2 usuarios, cuando elimino el primero, pregunto si esta contenido en el AdmUsuarios
	 */
	def void testEliminarUsuarioCasoPositivo()
	{
		var AdmUsuarios administrador = new AdmUsuarios()
		var Usuario usuarioMock1 = mock(Usuario)
		var Usuario usuarioMock2 = mock(Usuario)
		administrador.agregarUsuarioNuevo(usuarioMock1)
		administrador.agregarUsuarioNuevo(usuarioMock2)
		
		administrador.eliminarUsuario(usuarioMock1)
		
		Assert.assertFalse(administrador.usuarios.contains(usuarioMock1))
		Assert.assertEquals(1, administrador.usuarios.size())
	}
	
	@Test
	/**
	 * Dado un AdmUsuarios con 2 usuarios, cuando elimino el primero, pregunto si el 2do esta contenido en el AdmUsuarios.
	 */
	def void testEliminarUsuarioCasoNegativo()
	{
		var AdmUsuarios administrador = new AdmUsuarios()
		var Usuario usuarioMock1 = mock(Usuario)
		var Usuario usuarioMock2 = mock(Usuario)
		administrador.agregarUsuarioNuevo(usuarioMock1)
		administrador.agregarUsuarioNuevo(usuarioMock2)
		
		administrador.eliminarUsuario(usuarioMock1)
		
		Assert.assertTrue(administrador.usuarios.contains(usuarioMock2))
		Assert.assertEquals(1, administrador.usuarios.size())
	}
	
	@Test
	/**
	 * Dado un AdmUsuarios con 1 usuarios, blanqueo su contraseña y verifico que este blanqueado
	 */
	def void testBlanquearContrasenha()
	{
		var AdmUsuarios administrador = new AdmUsuarios()
		var Usuario usuarioMock = mock(Usuario)
		administrador.agregarUsuarioNuevo(usuarioMock)

		administrador.blanquearContrasenha(usuarioMock)
		
		verify(usuarioMock).blanqueoDeContrasenha
	}
	
	@Test
	/**
	 * Dado un AdmUsuarios con 2 usuarios, pregunto si su cantidad de usuario es igual a 2.
	 */
	def void testCantidadTotalDeUsuariosCasoPositivo()
	{
		var AdmUsuarios administrador = new AdmUsuarios()
		var Usuario usuarioMock1 = mock(Usuario)
		var Usuario usuarioMock2 = mock(Usuario)
		
		administrador.agregarUsuarioNuevo(usuarioMock1)
		administrador.agregarUsuarioNuevo(usuarioMock2)

		Assert.assertEquals(2,administrador.cantidadTotalDeUsuarios)
	}
	
	@Test
	/**
	 * Dado un AdmUsuarios con 2 usuarios, pregunto si su cantidad de usuario es igual a 1.
	 */
	def void testCantidadTotalDeUsuariosCasoNegativo()
	{
		var AdmUsuarios administrador = new AdmUsuarios()
		var Usuario usuarioMock1 = mock(Usuario)
		var Usuario usuarioMock2 = mock(Usuario)
		
		administrador.agregarUsuarioNuevo(usuarioMock1)
		administrador.agregarUsuarioNuevo(usuarioMock2)

		Assert.assertNotEquals(3,administrador.cantidadTotalDeUsuarios)
	}
	
	@Test
	/**
	 * Dado un AdmUsuarios con 1 usuario activo, pregunto por sus usuarios activos y si estos son igual a 1.
	 */
	def void testUsuariosActivosCasoPositivo()
	{
		var AdmUsuarios administrador = new AdmUsuarios()
		var Usuario usuarioMock = mock(Usuario)
		var List<Usuario> usuariosActivosMock = new ArrayList<Usuario>()
		
		usuariosActivosMock.add(usuarioMock)
		when(usuarioMock.activo).thenReturn(true)
		administrador.agregarUsuarioNuevo(usuarioMock)
		
		Assert.assertTrue(administrador.usuariosActivos.containsAll(usuariosActivosMock))
		Assert.assertEquals(1,administrador.usuariosActivos.size())
	}
	
	@Test
	/**
	 * Dado un AdmUsuarios con 1 usuario inactivo, pregunto por sus usuarios activos y si estos son 1.
	 */
	def void testUsuariosActivosCasoNegativo()
	{
		var AdmUsuarios administrador = new AdmUsuarios()
		var Usuario usuarioMock = mock(Usuario)
		var List<Usuario> usuariosActivosMock = new ArrayList<Usuario>()
		
		usuariosActivosMock.add(usuarioMock)
		when(usuarioMock.activo).thenReturn(false)
		administrador.agregarUsuarioNuevo(usuarioMock)
		
		Assert.assertFalse(administrador.usuariosActivos.containsAll(usuariosActivosMock))
		Assert.assertNotEquals(1,administrador.usuariosActivos.size())
	}
	
	@Test
	/**
	 * Dado un AdmUsuarios con 2 usuario activo, pregunto si su cantidad de usuarios activos son 2.
	 */
	def void testCantidadTotalDeUsuariosActivosCasoPositivo()
	{
		var AdmUsuarios administrador = new AdmUsuarios()
		var Usuario usuarioMock1 = mock(Usuario)
		var Usuario usuarioMock2 = mock(Usuario)
		var Usuario usuarioMock3 = mock(Usuario)
		administrador.agregarUsuarioNuevo(usuarioMock1)
		administrador.agregarUsuarioNuevo(usuarioMock2)
		administrador.agregarUsuarioNuevo(usuarioMock3)		
		
		when(usuarioMock1.activo).thenReturn(false)
		when(usuarioMock2.activo).thenReturn(true)
		when(usuarioMock3.activo).thenReturn(true)
		
		Assert.assertEquals(2,administrador.cantidadTotalDeUsuariosActivos)
	}
	
	@Test
	/**
	 * Dado un AdmUsuarios con 2 usuarios inactivo, pregunto si su cantidad de usuarios activos es 2.
	 */
	def void testCantidadTotalDeUsuariosActivosCasoNegativo()
	{
		var AdmUsuarios administrador = new AdmUsuarios()
		var Usuario usuarioMock1 = mock(Usuario)
		var Usuario usuarioMock2 = mock(Usuario)
		administrador.agregarUsuarioNuevo(usuarioMock1)
		administrador.agregarUsuarioNuevo(usuarioMock2)	
		
		when(usuarioMock1.activo).thenReturn(false)
		when(usuarioMock2.activo).thenReturn(false)
		
		Assert.assertNotEquals(2,administrador.cantidadTotalDeUsuariosActivos)
	}

	@Test
	/**
	 * Dado un AdmUsuarios con 2 usuario inactivo, pregunto si su cantidad de usuarios inactivos son 2.
	 */
	def void testCantidadTotalDeUsuarioActivosCasoPositivo()
	{
		var AdmUsuarios administrador = new AdmUsuarios()
		var Usuario usuarioMock1 = mock(Usuario)
		var Usuario usuarioMock2 = mock(Usuario)
		var Usuario usuarioMock3 = mock(Usuario)
		administrador.agregarUsuarioNuevo(usuarioMock1)
		administrador.agregarUsuarioNuevo(usuarioMock2)
		administrador.agregarUsuarioNuevo(usuarioMock3)		
		
		when(usuarioMock1.esInactivo).thenReturn(false)
		when(usuarioMock2.esInactivo).thenReturn(true)
		when(usuarioMock3.esInactivo).thenReturn(true)
		
		Assert.assertEquals(2,administrador.cantidadTotalDeUsuariosInactivos)
	}
	
	@Test
	/**
	 * Dado un AdmUsuarios con 2 usuarios activo, pregunto si su cantidad de usuarios inactivos es 2.
	 */
	def void testCantidadTotalDeUsuariosInactivosCasoNegativo()
	{
		var AdmUsuarios administrador = new AdmUsuarios()
		var Usuario usuarioMock1 = mock(Usuario)
		var Usuario usuarioMock2 = mock(Usuario)
		administrador.agregarUsuarioNuevo(usuarioMock1)
		administrador.agregarUsuarioNuevo(usuarioMock2)	
		
		when(usuarioMock1.esInactivo).thenReturn(false)
		when(usuarioMock2.esInactivo).thenReturn(false)
		
		Assert.assertNotEquals(2,administrador.cantidadTotalDeUsuariosInactivos)
	}
	
	@Test
	/**
	 * Dado un AdmUsuarios con 1 usuario inactivo, pregunto por sus usuarios inactivos y si estos son igual a 1.
	 */
	def void testUsuariosInactivosCasoPositivo()
	{
		var AdmUsuarios administrador = new AdmUsuarios()
		var Usuario usuarioMock = mock(Usuario)
		var List<Usuario> usuariosInactivosMock = new ArrayList<Usuario>()
		
		usuariosInactivosMock.add(usuarioMock)
		when(usuarioMock.esInactivo).thenReturn(true)
		administrador.agregarUsuarioNuevo(usuarioMock)
		
		Assert.assertTrue(administrador.usuariosInactivos.containsAll(usuariosInactivosMock))
		Assert.assertEquals(1,administrador.usuariosInactivos.size())
	}
	
	@Test
	/**
	 * Dado un AdmUsuarios con 1 usuario activo, pregunto por sus usuarios inactivos y si estos son 1.
	 */
	def void testUsuariosInactivosCasoNegativo()
	{
		var AdmUsuarios administrador = new AdmUsuarios()
		var Usuario usuarioMock = mock(Usuario)
		var List<Usuario> usuariosInactivosMock = new ArrayList<Usuario>()
		
		usuariosInactivosMock.add(usuarioMock)
		when(usuarioMock.esInactivo).thenReturn(false)
		administrador.agregarUsuarioNuevo(usuarioMock)
		
		Assert.assertFalse(administrador.usuariosInactivos.containsAll(usuariosInactivosMock))
		Assert.assertNotEquals(1,administrador.usuariosInactivos.size())
	}
	
	@Test
	/**
	 * Dado un AdmUsuarios con 1 usuario baneados, pregunto si su cantidad de usuarios baneados son 1.
	 */
	def void testCantidadTotalDeUsuariosBaneadosCasoPositivo()
	{
		var AdmUsuarios administrador = new AdmUsuarios()
		var Usuario usuarioMock1 = mock(Usuario)
		var Usuario usuarioMock2 = mock(Usuario)
		administrador.agregarUsuarioNuevo(usuarioMock1)
		administrador.agregarUsuarioNuevo(usuarioMock2)	
		
		when(usuarioMock1.baneado).thenReturn(false)
		when(usuarioMock2.baneado).thenReturn(true)
		
		Assert.assertEquals(1,administrador.cantidadTotalDeUsuariosBaneados)
	}
	
	@Test
	/**
	 * Dado un AdmUsuarios con 2 usuarios sin banear, pregunto si su cantidad de usuarios baneados es 2.
	 */
	def void testCantidadTotalDeUsuariosBaneadosCasoNegativo()
	{
		var AdmUsuarios administrador = new AdmUsuarios()
		var Usuario usuarioMock1 = mock(Usuario)
		var Usuario usuarioMock2 = mock(Usuario)
		administrador.agregarUsuarioNuevo(usuarioMock1)
		administrador.agregarUsuarioNuevo(usuarioMock2)	
		
		when(usuarioMock1.baneado).thenReturn(false)
		when(usuarioMock2.baneado).thenReturn(false)
		
		Assert.assertNotEquals(2,administrador.cantidadTotalDeUsuariosBaneados)
	}
	
	@Test
	/**
	 * Dado un AdmUsuarios con 1 usuario baneado, pregunto por sus usuarios baneados y si estos son igual a 1.
	 */
	def void testUsuariosBaneadosCasoPositivo()
	{
		var AdmUsuarios administrador = new AdmUsuarios()
		var Usuario usuarioMock = mock(Usuario)
		var List<Usuario> usuariosBaneadosMock = new ArrayList<Usuario>()
		
		usuariosBaneadosMock.add(usuarioMock)
		when(usuarioMock.baneado).thenReturn(true)
		administrador.agregarUsuarioNuevo(usuarioMock)
		
		Assert.assertTrue(administrador.usuariosBaneados.containsAll(usuariosBaneadosMock))
		Assert.assertEquals(1,administrador.usuariosBaneados.size())
	}
	
	@Test
	/**
	 * Dado un AdmUsuarios con 1 usuario sin banear, pregunto por sus usuarios baneados y si estos son 1.
	 */
	def void testUsuariosBaneadosCasoNegativo()
	{
		var AdmUsuarios administrador = new AdmUsuarios()
		var Usuario usuarioMock = mock(Usuario)
		var List<Usuario> usuariosBaneadosMock = new ArrayList<Usuario>()
		
		usuariosBaneadosMock.add(usuarioMock)
		when(usuarioMock.baneado).thenReturn(false)
		administrador.agregarUsuarioNuevo(usuarioMock)
		
		Assert.assertFalse(administrador.usuariosBaneados.containsAll(usuariosBaneadosMock))
		Assert.assertNotEquals(1,administrador.usuariosBaneados.size())
	}
	
		@Test
	/**
	 * Dado un AdmUsuarios con 1 usuario de nombre "Liza", pregunto por sus usuarios de nombre "Liza" y si estos son igual a 1.
	 */
	def void testBuscarUsuarioDeNombreCasoPositivo()
	{
		var AdmUsuarios administrador = new AdmUsuarios()
		var Usuario usuarioMock = mock(Usuario)
		var List<Usuario> usuariosLizaMock = new ArrayList<Usuario>()
		usuariosLizaMock.add(usuarioMock)
		
		when(usuarioMock.deNombre("Liza")).thenReturn(true)
		administrador.agregarUsuarioNuevo(usuarioMock)
		
		Assert.assertTrue(administrador.buscarUsuarioDeNombre("Liza").containsAll(usuariosLizaMock))
		Assert.assertEquals(1,administrador.buscarUsuarioDeNombre("Liza").size())
	}
	
	@Test
	/**
	 * Dado un AdmUsuarios con 1 usuario con nombre "Liza" y otro "Melody", pregunto por los usuarios de nombre "" y si estos son igual a 2.
	 */
	def void testBuscarUsuarioDeNombreCasoPositivoSinNombre()
	{
		var AdmUsuarios administrador = new AdmUsuarios()
		var Usuario usuarioLizaMock = mock(Usuario)
		var Usuario usuarioMelodyMock = mock(Usuario)
		var List<Usuario> usuariosMock = new ArrayList<Usuario>()
		
		usuariosMock.add(usuarioLizaMock)
		usuariosMock.add(usuarioMelodyMock)
		administrador.agregarUsuarioNuevo(usuarioLizaMock)
		administrador.agregarUsuarioNuevo(usuarioMelodyMock)
		
		Assert.assertTrue(administrador.buscarUsuarioDeNombre("").containsAll(usuariosMock))
		Assert.assertEquals(2,administrador.buscarUsuarioDeNombre("").size())
	}
	
	@Test
	/**
	 * Dado un AdmUsuarios con 1 usuario con nombre "Liza", pregunto por los usuarios de nombre "Melody" y si estos son igual a 1.
	 */
	def void testBuscarUsuarioDeNombreCasoNegativo()
	{
		var AdmUsuarios administrador = new AdmUsuarios()
		var Usuario usuarioMock = mock(Usuario)
		var List<Usuario> usuariosMelodyMock = new ArrayList<Usuario>()
		
		usuariosMelodyMock.add(usuarioMock)
		when(usuarioMock.deNombre("Melody")).thenReturn(false)
		administrador.agregarUsuarioNuevo(usuarioMock)
		
		Assert.assertFalse(administrador.buscarUsuarioDeNombre("Melody").containsAll(usuariosMelodyMock))
		Assert.assertNotEquals(1,administrador.buscarUsuarioDeNombre("Melody").size())
	}
	
	@Test
	/**
	 * Dado un AdmUsuarios con 1 usuario con nombre "Liza" y otro "Melody", pregunto por los usuarios de nombre "" y si estos son igual a 0.
	 */
	def void testBuscarUsuarioDeNombreCasoNegativoSinNombre()
	{
		var AdmUsuarios administrador = new AdmUsuarios()
		var Usuario usuarioLizaMock = mock(Usuario)
		var Usuario usuarioMelodyMock = mock(Usuario)
		var List<Usuario> usuariosMock = new ArrayList<Usuario>()
		
		administrador.agregarUsuarioNuevo(usuarioLizaMock)
		administrador.agregarUsuarioNuevo(usuarioMelodyMock)
		
		Assert.assertFalse(usuariosMock.containsAll(administrador.buscarUsuarioDeNombre("")))
		Assert.assertNotEquals(0,administrador.buscarUsuarioDeNombre("").size())
	}
	
	@Test
	/**
	 * Dado un AdmUsuarios con 2 usuario "Liza" y "Camila", cuando le cambio el nombre a "Liza" por "Camila" no me lo permite.
	 */
	def void testCambiarNombreSiPuedeCasoPositivo()
	{
		var AdmUsuarios administrador = new AdmUsuarios()
		var Usuario usuarioMock1 = mock(Usuario)
		var Usuario usuarioMock2 = mock(Usuario)
		
		when(usuarioMock1.nombre).thenReturn("Liza")
		when(usuarioMock2.nombre).thenReturn("Camila")
		administrador.agregarUsuarioNuevo(usuarioMock1)
		administrador.agregarUsuarioNuevo(usuarioMock2)
		
		administrador.cambiarNombreSiPuede(usuarioMock2, "Liza")
		Assert.assertEquals("Camila", usuarioMock2.nombre)
	}
	
}