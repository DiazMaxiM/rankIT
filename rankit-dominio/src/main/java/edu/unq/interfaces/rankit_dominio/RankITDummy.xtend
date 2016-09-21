package edu.unq.interfaces.rankit_dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class RankITDummy {

	RankIT rankit

	new() {

		val admCalificaciones = new AdmCalificaciones
		val admLugares = new AdmPuntuables
		val admServicios = new AdmPuntuables
		val usuarioMaxi = new Usuario
		val usuarioLiza = new Usuario
		val usuarioRosali = new Usuario

	var Usuario admin = new Usuario => [
			activo = true
			baneado = false
			nombre = "Admin"
			password = "123"

		];

		usuarioMaxi => [
			activo = true
			baneado = false
			nombre = "Maxi"
			password = "Maxi"

		];
		
		usuarioLiza => [
			activo = false
			baneado = true
			nombre = "Liza"
			password = "Liza"

		];
		usuarioRosali => [
			activo = false
			baneado = false
			nombre = "Rosali"
			password = "Rosali"

		];
		val lugarParaCalificacion1 = new Puntuable => [
			habilitado = true
			nombre = "Abasto"
		]
		val lugar2 = new Puntuable => [
			habilitado = true
			nombre = "Freddo"
		]
		val servicioParaCalificacion1 = new Puntuable => [
			habilitado = true
			nombre = "Metrogas"
		]
		val servicio2 = new Puntuable => [
			habilitado = true
			nombre = "Edesur"
		]

		val calificacion1 = new Calificacion(usuarioMaxi) => [

			contenidoOfensivo = true
			puntos = 15
			detalle = "Detalle Calififcacion Lugar 1"
			evaluado = lugarParaCalificacion1
		]
		val calificacion2 = new Calificacion(usuarioMaxi) => [

			contenidoOfensivo = false
			puntos = 15
			detalle = "Detalle Calififcacion Servicio 1"
			evaluado = servicioParaCalificacion1
		]
		val calificacion3 = new Calificacion(usuarioLiza) => [

			contenidoOfensivo = false
			puntos = 5
			detalle = "Detalle Calififcacion Servicio 1"
			evaluado = servicioParaCalificacion1
		]

		admCalificaciones.agregarCalificacion(calificacion1)
		admCalificaciones.agregarCalificacion(calificacion2)
		admCalificaciones.agregarCalificacion(calificacion3)

		admServicios.agregar(servicioParaCalificacion1)
		admServicios.agregar(servicio2)
		admLugares.agregar(lugar2)
		admLugares.agregar(lugarParaCalificacion1)

		val admUsuario = new AdmUsuarios()

		admUsuario.agregarUsuarioNuevo(usuarioMaxi)
		admUsuario.agregarUsuarioNuevo(usuarioLiza)
		admUsuario.agregarUsuarioNuevo(usuarioRosali)
		admUsuario.agregarUsuarioNuevo(admin)

		rankit = new RankIT()
		rankit.admLugares = admLugares
		rankit.admServicios = admServicios
		rankit.usuarioLogeado = admin
		rankit.admUsuarios = admUsuario
		rankit.admCalificaciones = admCalificaciones

	}
}
