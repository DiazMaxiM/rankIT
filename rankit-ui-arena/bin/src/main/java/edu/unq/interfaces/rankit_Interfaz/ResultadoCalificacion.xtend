package edu.unq.interfaces.rankit_Interfaz

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import edu.unq.interfaces.rankit_dominio.Calificacion
import edu.unq.interfaces.rankit_dominio.Usuario
import edu.unq.interfaces.rankit_dominio.Puntuable

@Accessors
@Observable
class ResultadoCalificacion {
	
	Calificacion calificacion
	Usuario		 usuario
	Puntuable	 evaluado
	
	def getNombre()
	{
		evaluado.nombre
	}
	def getPuntos(){
		calificacion.puntos
	}
	def getFecha(){
		calificacion.fecha
	}
	def getUser(){
		usuario.nombre
	}
	def getOfensiva(){
		calificacion.esCalificacionOfensiva
	}
}