package edu.unq.interfaces.rankit_dominio

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class RankITDummy {
	
	RankIT rankit
	
	new (){
		
		
		val admCalificaciones = new AdmCalificaciones
		
		val usuarioMaxi = new Usuario
		val usuarioLiza = new Usuario
		val usuarioRosali = new Usuario
		
		
		usuarioMaxi=>[
			activo=true
			baneado = false
			nombre="Maxi"
			password = "Maxi"
			
		];
		usuarioLiza=>[
			activo=true
			baneado = true
			nombre="Liza"
			password = "Liza"
			
		];
		usuarioRosali=>[
			activo=false
			baneado = false
			nombre="Rosali"
			password = "Rosali"
			
		];
		val lugarParaCalificacion1 = new Lugar =>[
			habilitado=true
			nombre="Lugar 1"
		]
		val lugar2 = new Lugar =>[
			habilitado=true
			nombre="Lugar 2"
		]
		val servicioParaCalificacion1 = new Servicio =>[
			habilitado=true
			nombre="Servicio 1"
		]
		val servicio2 = new Servicio =>[
			habilitado=true
			nombre="Servicio 2"
		]
		
		val calificacion1 = new Calificacion()=>[
		
		usuario = usuarioMaxi
		contenidoOfensivo=false
		puntos=15
		detalle="Detalle Calififcacion Lugar 1"
		evaluado = lugarParaCalificacion1
		]
		val calificacion2 = new Calificacion()=>[
		
		usuario = usuarioMaxi
		contenidoOfensivo=false
		puntos=15
		detalle="Detalle Calififcacion Servicio 1"
		evaluado = servicioParaCalificacion1
		]
		
		admCalificaciones.agregarCalificacion(calificacion1)
		admCalificaciones.agregarCalificacion(calificacion2)
		
		rankit = new RankIT()
		rankit.agregarLugar(lugarParaCalificacion1)
		rankit.agregarLugar(lugar2)
		rankit.agregarServicio(servicioParaCalificacion1)
		rankit.agregarServicio(servicio2)
		rankit.usuarioLogeado= usuarioMaxi
		rankit.agregarUsuario(usuarioMaxi) 
		rankit.agregarUsuario(usuarioLiza) 
		rankit.agregarUsuario(usuarioRosali) 
		rankit.admCalificaciones = admCalificaciones
	
	}
}