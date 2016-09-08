package edu.unq.interfaces.rankit_dominio

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class RankITDummy {
	
	RankIT rankit
	
	def RankITDummy(){
		val calificacion1 = new Calificacion()
		
		
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
		
		
		calificacion1.usuario = usuarioMaxi
		calificacion1.contenidoOfensivo=false
		calificacion1.puntos=15
		calificacion1.detalle="Detalle Calififcacion 1"
		calificacion1.evaluado = lugarParaCalificacion1
		
		admCalificaciones.agregarCalificacion(calificacion1)
		
		rankit = new RankIT()
		rankit.agregarUsuario(usuarioMaxi) 
		rankit.agregarUsuario(usuarioLiza) 
		rankit.agregarUsuario(usuarioRosali) 
		rankit.admCalificaciones = admCalificaciones
	
	}
}