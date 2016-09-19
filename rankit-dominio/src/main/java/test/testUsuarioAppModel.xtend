package test

import edu.unq.interfaces.rankit_dominio.AdmUsuarios
import edu.unq.interfaces.rankit_dominio.Usuario
import org.junit.Assert
import org.junit.Before
import org.junit.Test

import static org.mockito.Mockito.*
import java.util.List
import java.util.ArrayList
import edu.unq.interfaces.rankit_dominio.UsuarioAppModel
import edu.unq.interfaces.rankit_dominio.AdmCalificaciones
import edu.unq.interfaces.rankit_dominio.AdmPuntuables

class testUsuarioAppModel 
{
	@Before
	def void setUp()
	{
		
	}
	
	@Test
	/**
	 * Dado un appUsuario con 1 usuarios registrado, le pregunto si este es igual a 1.
	 */
	def void testCantidadDeUsuariosRegistrados()
	{
		val AdmUsuarios administradorMock = mock (AdmUsuarios)
		val UsuarioAppModel appUsuario = new UsuarioAppModel(administradorMock)
		
		when (administradorMock.cantidadTotalDeUsuarios).thenReturn(1)
		Assert.assertEquals(1, appUsuario.cantidadDeUsuariosRegistrados)
		verify(administradorMock).cantidadTotalDeUsuarios
	}
	
	@Test
	/**
	 * Dado un appUsuario con 1 usuarios activos, le pregunto si este es igual a 1.
	 */
	def void testCantidadDeUsuariosActivos()
	{
		val AdmUsuarios administradorMock = mock (AdmUsuarios)
		val UsuarioAppModel appUsuario = new UsuarioAppModel(administradorMock)
		
		when (administradorMock.cantidadTotalDeUsuariosActivos).thenReturn(1)
		Assert.assertEquals(1, appUsuario.cantidadDeUsuariosActivos)
		verify(administradorMock).cantidadTotalDeUsuariosActivos
	}
	
	@Test
	/**
	 * Dado un appUsuario con 1 usuarios inactivos, le pregunto si este es igual a 1.
	 */
	def void testCantidadDeUsuariosInactivos()
	{
		val AdmUsuarios administradorMock = mock (AdmUsuarios)
		val UsuarioAppModel appUsuario = new UsuarioAppModel(administradorMock)
		
		when (administradorMock.cantidadTotalDeUsuariosInactivos).thenReturn(1)
		Assert.assertEquals(1, appUsuario.cantidadDeUsuariosInactivos)
		verify(administradorMock).cantidadTotalDeUsuariosInactivos
	}
	
	@Test
	/**
	 * Dado un appUsuario con 1 usuarios baneado, le pregunto si este es igual a 1.
	 */
	def void testCantidadDeUsuariosBaneado()
	{
		val AdmUsuarios administradorMock = mock (AdmUsuarios)
		val UsuarioAppModel appUsuario = new UsuarioAppModel(administradorMock)
		
		when (administradorMock.cantidadTotalDeUsuariosBaneados).thenReturn(1)
		Assert.assertEquals(1, appUsuario.cantidadDeUsuariosBaneados)
		verify(administradorMock).cantidadTotalDeUsuariosBaneados
	}
	
//	@Test
//	/**
//	 * Dado un appUsuario con 2 usuarios, elimino uno y le pregunto si queda el otro.
//	 */
//	def void testEliminarUsuario()
//	{
//		val Usuario usuarioMock1 = mock(Usuario)
//		val Usuario usuarioMock2 = mock(Usuario)
//		
//		val AdmUsuarios admUsuariosMock = mock (AdmUsuarios)
//		admUsuariosMock.agregarUsuarioNuevo(usuarioMock1)
//		admUsuariosMock.agregarUsuarioNuevo(usuarioMock2)
//		
//		val AdmCalificaciones admCalificacionesMock = mock (AdmCalificaciones)
//		val AdmPuntuables admPuntuablesMock = mock (AdmPuntuables)
//		val Usuario usuarioLogMock = mock(Usuario)
//		
//		val UsuarioAppModel appUsuario = new UsuarioAppModel(admUsuariosMock, admCalificacionesMock, admPuntuablesMock, usuarioLogMock)
//		appUsuario.usuarioSeleccionado=usuarioMock1
//		
//		appUsuario.eliminarUsuario()
//		
//		val List<Usuario> usuarioResultante = new ArrayList<Usuario>
//		usuarioResultante.add(usuarioMock2)
//		
//		Assert.assertTrue(appUsuario.usuarioSeleccionado==null)
//		verify(admUsuariosMock).eliminarUsuario(usuarioMock1)
//		Assert.assertFalse(appUsuario.usuarios.contains(usuarioMock1))
//	}

	@Test
	/**
	 * Dado un appUsuario con 1 usuarios seleccionado, le blanqueo la contraseña y le pregunto si esta blanqueada.
	 */
	def void testBlanquearContrasenha()
	{
		val AdmCalificaciones admCalificacionesMock = mock (AdmCalificaciones)
		val AdmPuntuables admPuntuablesMock = mock (AdmPuntuables)
		val AdmUsuarios admUsuariosMock = mock (AdmUsuarios)
		val Usuario usuarioLogMock = mock(Usuario)
		val Usuario usuarioMock1 = mock(Usuario)
		val Usuario usuarioMock2 = mock(Usuario)
		
		admUsuariosMock.agregarUsuarioNuevo(usuarioMock1)
		admUsuariosMock.agregarUsuarioNuevo(usuarioMock2)
		
		val UsuarioAppModel appUsuario = new UsuarioAppModel(admUsuariosMock, admCalificacionesMock, admPuntuablesMock, usuarioLogMock)
		appUsuario.usuarioSeleccionado = usuarioMock1
		
		when(usuarioMock1.password).thenReturn("123")
		appUsuario.blanquearContrasenha
		
		Assert.assertTrue(appUsuario.usuarioSeleccionado.password.equals("123"))
		verify(admUsuariosMock).blanquearContrasenha(usuarioMock1)
	}
	
//	@Test
//	/**
//	 * Dado un appUsuario con 2 usuario, pregunto por el usuario con nombre "Liza".
//	 */
//	def void testBuscarPorNombreDeUsuario()
//	{
//		val AdmCalificaciones admCalificacionesMock = mock (AdmCalificaciones)
//		val AdmPuntuables admPuntuablesMock = mock (AdmPuntuables)
//		val AdmUsuarios admUsuariosMock = mock (AdmUsuarios)
//		val Usuario usuarioLogMock = mock(Usuario)
//		val Usuario usuarioMock1 = mock(Usuario)
//		val Usuario usuarioMock2 = mock(Usuario)
//		
//		admUsuariosMock.agregarUsuarioNuevo(usuarioMock1)
//		admUsuariosMock.agregarUsuarioNuevo(usuarioMock2)
//		
//		val UsuarioAppModel appUsuario = new UsuarioAppModel(admUsuariosMock, admCalificacionesMock, admPuntuablesMock, usuarioLogMock)
//		appUsuario.nombreDeUsuarioABuscar = "Liza"
//		
//		when(usuarioMock1.nombre).thenReturn("Liza")
//		when(usuarioMock2.nombre).thenReturn("Camila")
//		when(usuarioMock1.deNombre("Liza")).thenReturn(true)
//		when(usuarioMock2.deNombre("Liza")).thenReturn(false)
//		
//		val List<Usuario> resultado = new ArrayList<Usuario>()
//		resultado.add(usuarioMock1)
//		
//		//Assert.assertEquals(resultado, appUsuario.buscarPorNombreDeUsuario)
//		verify(appUsuario.administradorDeUsuarios).buscarUsuarioDeNombre("Liza")
//	}

	@Test
	/**
	 * Dado un appUsuario con el nombre de usuario a buscar, lo cambio a "Camila" .
	 */
	def void testSetNombreABuscar()
	{
		val AdmCalificaciones admCalificacionesMock = mock (AdmCalificaciones)
		val AdmPuntuables admPuntuablesMock = mock (AdmPuntuables)
		val AdmUsuarios admUsuariosMock = mock (AdmUsuarios)
		val Usuario usuarioLogMock = mock(Usuario)
		val Usuario usuarioMock1 = mock(Usuario)
		val Usuario usuarioMock2 = mock(Usuario)
		
		admUsuariosMock.agregarUsuarioNuevo(usuarioMock1)
		admUsuariosMock.agregarUsuarioNuevo(usuarioMock2)
		
		val UsuarioAppModel appUsuario = new UsuarioAppModel(admUsuariosMock, admCalificacionesMock, admPuntuablesMock, usuarioLogMock)
		appUsuario.nombreDeUsuarioABuscar = "Liza"
		
		appUsuario.setNombreDeUsuarioABuscar("Camila")
		
		Assert.assertEquals("Camila", appUsuario.nombreDeUsuarioABuscar)
	}

//	@Test
//	/**
//	 * Dado un appUsuario sin usuarios, le agrego uno y pregunto si se agrego.
//	 */
//	def void testAgregarNuevoUsuario()
//	{
//		val AdmCalificaciones admCalificacionesMock = mock (AdmCalificaciones)
//		val AdmPuntuables admPuntuablesMock = mock (AdmPuntuables)
//		val AdmUsuarios admUsuariosMock = mock (AdmUsuarios)
//		val Usuario usuarioLogMock = mock(Usuario)
//		val Usuario usuarioMock1 = mock(Usuario)
//		
//		admUsuariosMock.agregarUsuarioNuevo(usuarioMock1)
//		
//		val UsuarioAppModel appUsuario = new UsuarioAppModel(admUsuariosMock, admCalificacionesMock, admPuntuablesMock, usuarioLogMock)
//		
//		when(admUsuariosMock.cantidadTotalDeUsuarios).thenReturn(1)
//		
//		Assert.assertEquals(1, appUsuario.cantidadDeUsuariosRegistrados)
//		Assert.assertEquals(appUsuario.usuarios.contains(usuarioMock1))
//		
//		verify(appUsuario.administradorDeUsuarios).cantidadTotalDeUsuarios
//	}

	@Test
	/**
	 * Dado un appUsuario con el nombre de usuario "Liza", le pido su nombre.
	 */
	def void testGetNombre()
	{
		val AdmCalificaciones admCalificacionesMock = mock (AdmCalificaciones)
		val AdmPuntuables admPuntuablesMock = mock (AdmPuntuables)
		val AdmUsuarios admUsuariosMock = mock (AdmUsuarios)
		val Usuario usuarioLogMock = mock(Usuario)
		val Usuario usuarioMock1 = mock(Usuario)
		
		admUsuariosMock.agregarUsuarioNuevo(usuarioMock1)
		
		val UsuarioAppModel appUsuario = new UsuarioAppModel(admUsuariosMock, admCalificacionesMock, admPuntuablesMock, usuarioLogMock)
		appUsuario.usuarioSeleccionado = usuarioMock1
		
		when (usuarioMock1.nombre).thenReturn("Liza")
		
		Assert.assertEquals("Liza", appUsuario.nombre)
	}

	@Test
	/**
	 * Dado un appUsuario con el nombre de usuario "Liza", se lo cambio a "Camila"
	 */
	def void testSetNombre()
	{
		val AdmCalificaciones admCalificacionesMock = mock (AdmCalificaciones)
		val AdmPuntuables admPuntuablesMock = mock (AdmPuntuables)
		val AdmUsuarios admUsuariosMock = mock (AdmUsuarios)
		val Usuario usuarioLogMock = mock(Usuario)
		val Usuario usuarioMock1 = mock(Usuario)
		
		admUsuariosMock.agregarUsuarioNuevo(usuarioMock1)
		
		val UsuarioAppModel appUsuario = new UsuarioAppModel(admUsuariosMock, admCalificacionesMock, admPuntuablesMock, usuarioLogMock)
		appUsuario.usuarioSeleccionado = usuarioMock1
		
		when (usuarioMock1.nombre).thenReturn("Camila")
		appUsuario.setNombre("Camila")
		
		Assert.assertEquals("Camila", appUsuario.nombre)
	}

	@Test
	/**
	 * Dado un appUsuario con un usuario seleccionado, le pregunto si tiene usuario seleccionado
	 */
	def void testHayUsuarioSeleccionado()
	{
		val AdmCalificaciones admCalificacionesMock = mock (AdmCalificaciones)
		val AdmPuntuables admPuntuablesMock = mock (AdmPuntuables)
		val AdmUsuarios admUsuariosMock = mock (AdmUsuarios)
		val Usuario usuarioLogMock = mock(Usuario)
		val Usuario usuarioMock1 = mock(Usuario)
		
		admUsuariosMock.agregarUsuarioNuevo(usuarioMock1)
		
		val UsuarioAppModel appUsuario = new UsuarioAppModel(admUsuariosMock, admCalificacionesMock, admPuntuablesMock, usuarioLogMock)
		appUsuario.usuarioSeleccionado = usuarioMock1
		
		Assert.assertTrue(appUsuario.hayUsuarioSeleccionado)
	}
	
	@Test
	/**
	 * Dado un appUsuario con un usuario activo, pregunto si esta activo.
	 */
	def void testGetActivo()
	{
		val AdmCalificaciones admCalificacionesMock = mock (AdmCalificaciones)
		val AdmPuntuables admPuntuablesMock = mock (AdmPuntuables)
		val AdmUsuarios admUsuariosMock = mock (AdmUsuarios)
		val Usuario usuarioLogMock = mock(Usuario)
		val Usuario usuarioMock1 = mock(Usuario)
		
		admUsuariosMock.agregarUsuarioNuevo(usuarioMock1)
		
		val UsuarioAppModel appUsuario = new UsuarioAppModel(admUsuariosMock, admCalificacionesMock, admPuntuablesMock, usuarioLogMock)
		appUsuario.usuarioSeleccionado = usuarioMock1
		
		when (usuarioMock1.activo).thenReturn(true)
		
		Assert.assertTrue(appUsuario.activo)
	}
	
	@Test
	/**
	 * Dado un appUsuario con un usuario inactivo, setea su valor cambiando su estado a activo.
	 */
	def void testSetActivoCasoPositivo()
	{
		val AdmCalificaciones admCalificacionesMock = mock (AdmCalificaciones)
		val AdmPuntuables admPuntuablesMock = mock (AdmPuntuables)
		val AdmUsuarios admUsuariosMock = mock (AdmUsuarios)
		val Usuario usuarioLogMock = mock(Usuario)
		val Usuario usuarioMock1 = mock(Usuario)
		
		admUsuariosMock.agregarUsuarioNuevo(usuarioMock1)
		
		val UsuarioAppModel appUsuario = new UsuarioAppModel(admUsuariosMock, admCalificacionesMock, admPuntuablesMock, usuarioLogMock)
		appUsuario.usuarioSeleccionado = usuarioMock1
		
		when(appUsuario.usuarioSeleccionado.esInactivo).thenReturn(true)
		when(usuarioMock1.activo).thenReturn(true)
		
		appUsuario.setActivo(true)
		
		Assert.assertTrue(appUsuario.activo)
	}
	
	@Test
	/**
	 * Dado un appUsuario con un usuario activo, lo seteo y cambia su estado a inactivo.
	 */
	def void testSetActivoCasoNegativo()
	{
		val AdmCalificaciones admCalificacionesMock = mock (AdmCalificaciones)
		val AdmPuntuables admPuntuablesMock = mock (AdmPuntuables)
		val AdmUsuarios admUsuariosMock = mock (AdmUsuarios)
		val Usuario usuarioLogMock = mock(Usuario)
		val Usuario usuarioMock1 = mock(Usuario)
		
		admUsuariosMock.agregarUsuarioNuevo(usuarioMock1)
		
		val UsuarioAppModel appUsuario = new UsuarioAppModel(admUsuariosMock, admCalificacionesMock, admPuntuablesMock, usuarioLogMock)
		appUsuario.usuarioSeleccionado = usuarioMock1
		
		usuarioMock1.activarUsuario

		appUsuario.setActivo(true)
		Assert.assertFalse(appUsuario.activo)
	}
	
	@Test
	/**
	 * Dado un appUsuario con un usuario baneado, le pregunto si lo esta.
	 */
	def void testGetBaneado()
	{
		val AdmCalificaciones admCalificacionesMock = mock (AdmCalificaciones)
		val AdmPuntuables admPuntuablesMock = mock (AdmPuntuables)
		val AdmUsuarios admUsuariosMock = mock (AdmUsuarios)
		val Usuario usuarioLogMock = mock(Usuario)
		val Usuario usuarioMock1 = mock(Usuario)
		
		admUsuariosMock.agregarUsuarioNuevo(usuarioMock1)
		
		val UsuarioAppModel appUsuario = new UsuarioAppModel(admUsuariosMock, admCalificacionesMock, admPuntuablesMock, usuarioLogMock)
		appUsuario.usuarioSeleccionado = usuarioMock1
		
		when (usuarioMock1.baneado).thenReturn(true)
		
		Assert.assertTrue(appUsuario.baneado)
	}
	
	@Test
	/**
	 * Dado un appUsuario con un usuario sin banear, setea su valor cambiando su estado a baneado.
	 */
	def void testSetBaneadoCasoPositivo()
	{
		val AdmCalificaciones admCalificacionesMock = mock (AdmCalificaciones)
		val AdmPuntuables admPuntuablesMock = mock (AdmPuntuables)
		val AdmUsuarios admUsuariosMock = mock (AdmUsuarios)
		val Usuario usuarioLogMock = mock(Usuario)
		val Usuario usuarioMock1 = mock(Usuario)
		
		admUsuariosMock.agregarUsuarioNuevo(usuarioMock1)
		
		val UsuarioAppModel appUsuario = new UsuarioAppModel(admUsuariosMock, admCalificacionesMock, admPuntuablesMock, usuarioLogMock)
		appUsuario.usuarioSeleccionado = usuarioMock1
		
		when(usuarioMock1.baneado).thenReturn(true)
		
		appUsuario.setBaneado(true)
		
		Assert.assertTrue(appUsuario.baneado)
		Assert.assertFalse(appUsuario.activo)
	}
	
	@Test
	/**
	 * Dado un appUsuario con un usuario baneado, lo seteo y cambia su estado a desbaneado.
	 */
	def void testSetBaneadoCasoNegativo()
	{
		val AdmCalificaciones admCalificacionesMock = mock (AdmCalificaciones)
		val AdmPuntuables admPuntuablesMock = mock (AdmPuntuables)
		val AdmUsuarios admUsuariosMock = mock (AdmUsuarios)
		val Usuario usuarioLogMock = mock(Usuario)
		val Usuario usuarioMock1 = mock(Usuario)
		
		admUsuariosMock.agregarUsuarioNuevo(usuarioMock1)
		
		val UsuarioAppModel appUsuario = new UsuarioAppModel(admUsuariosMock, admCalificacionesMock, admPuntuablesMock, usuarioLogMock)
		appUsuario.usuarioSeleccionado = usuarioMock1
		
		usuarioMock1.banearUsuario

		appUsuario.setBaneado(true)
		Assert.assertFalse(appUsuario.baneado)
	}
	
	@Test
	/**
	 * Dado un appUsuario con un usuario seleccionado, le pido su fecha de registro.
	 */
	def void testGetFechaDeRegistroDelUsuario()
	{
		val AdmCalificaciones admCalificacionesMock = mock (AdmCalificaciones)
		val AdmPuntuables admPuntuablesMock = mock (AdmPuntuables)
		val AdmUsuarios admUsuariosMock = mock (AdmUsuarios)
		val Usuario usuarioLogMock = mock(Usuario)
		val Usuario usuarioMock1 = mock(Usuario)
		
		admUsuariosMock.agregarUsuarioNuevo(usuarioMock1)
		
		val UsuarioAppModel appUsuario = new UsuarioAppModel(admUsuariosMock, admCalificacionesMock, admPuntuablesMock, usuarioLogMock)
		appUsuario.usuarioSeleccionado = usuarioMock1
		
		Assert.assertEquals(usuarioMock1.fechaDeRegistro, appUsuario.fechaDeRegistroDelUsuario)
	}
	
//	@Test
//	/**
//	 * Dado un appUsuario con 1 usuario a buscar, le pido que me devuelva ese usuario.
//	 */
//	def void testGetUsuariosCasoPositivo()
//	{
//		val AdmCalificaciones admCalificacionesMock = mock (AdmCalificaciones)
//		val AdmPuntuables admPuntuablesMock = mock (AdmPuntuables)
//		val AdmUsuarios admUsuariosMock = mock (AdmUsuarios)
//		val Usuario usuarioLogMock = mock(Usuario)
//		val Usuario usuarioMock1 = mock(Usuario)
//		val Usuario usuarioMock2 = mock(Usuario)
//		
//		admUsuariosMock.agregarUsuarioNuevo(usuarioMock1)
//		admUsuariosMock.agregarUsuarioNuevo(usuarioMock2)
//		
//		val UsuarioAppModel appUsuario = new UsuarioAppModel(admUsuariosMock, admCalificacionesMock, admPuntuablesMock, usuarioLogMock)
//		appUsuario.usuarioSeleccionado = usuarioMock1
//		appUsuario.nombreDeUsuarioABuscar = "Camila"
//		
//		when(usuarioMock1.deNombre("Camila")).thenReturn(true)
//		when(usuarioMock2.deNombre("Camila")).thenReturn(false)
//		
//		//when(appUsuario.hayUsuarioABuscar).thenReturn(true)
//		
//		Assert.assertTrue(appUsuario.usuarios.contains(usuarioMock1))
//	}
	
	@Test
	/**
	 * Dado un appUsuario con un nombre de usuario a buscar, le pregunto si tiene un nombre de usuario a buscar
	 */
	def void testHayUsuarioABuscarCasoPositivo()
	{
		val AdmCalificaciones admCalificacionesMock = mock (AdmCalificaciones)
		val AdmPuntuables admPuntuablesMock = mock (AdmPuntuables)
		val AdmUsuarios admUsuariosMock = mock (AdmUsuarios)
		val Usuario usuarioLogMock = mock(Usuario)
		val Usuario usuarioMock1 = mock(Usuario)
		
		admUsuariosMock.agregarUsuarioNuevo(usuarioMock1)
		
		val UsuarioAppModel appUsuario = new UsuarioAppModel(admUsuariosMock, admCalificacionesMock, admPuntuablesMock, usuarioLogMock)
		appUsuario.nombreDeUsuarioABuscar = "Liza"
		
		Assert.assertTrue(appUsuario.hayUsuarioABuscar)
	}
	
	@Test
	/**
	 * Dado un appUsuario sin un nombre de usuario a buscar, le pregunto si tiene un nombre de usuario a buscar
	 */
	def void testHayUsuarioABuscarCasoNegativo()
	{
		val AdmCalificaciones admCalificacionesMock = mock (AdmCalificaciones)
		val AdmPuntuables admPuntuablesMock = mock (AdmPuntuables)
		val AdmUsuarios admUsuariosMock = mock (AdmUsuarios)
		val Usuario usuarioLogMock = mock(Usuario)
		val Usuario usuarioMock1 = mock(Usuario)
		
		admUsuariosMock.agregarUsuarioNuevo(usuarioMock1)
		
		val UsuarioAppModel appUsuario = new UsuarioAppModel(admUsuariosMock, admCalificacionesMock, admPuntuablesMock, usuarioLogMock)
		appUsuario.nombreDeUsuarioABuscar = ""
		
		Assert.assertFalse(appUsuario.hayUsuarioABuscar)
	}
	
}

