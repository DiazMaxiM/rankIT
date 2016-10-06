package edu.unq.interfaces.rankit_dominio

import java.util.ArrayList
import java.util.List

class AdmCalificacionesResumidas {

	private List<CalificacionResumida> listaCalificacionesResumidas = new ArrayList

	def agregar(List<CalificacionResumida> resumidas) {
		listaCalificacionesResumidas.addAll(resumidas)
	}

	def List<CalificacionResumida> filtrar(String nombre, String tipo, String ranking, String cantidadCalificaciones) {
		var List<CalificacionResumida> listaFiltrada= new ArrayList ;
		listaFiltrada.addAll(listaCalificacionesResumidas);
		if (!nombre.isNullOrEmpty) {
			listaFiltrada =listaFiltrada.filter[calificacion|calificacion.puntuableBasico.nombre.equals(nombre)].toList
		}
		if (!tipo.isNullOrEmpty) {
			listaFiltrada =listaFiltrada.filter[calificacion|calificacion.puntuableBasico.tipo.toString.equals(tipo)].toList
		}
		if (!ranking.isNullOrEmpty) {
			listaFiltrada =listaFiltrada.filter[calificacion|calificacion.ranking.toString.equals(ranking)].toList
		}
		if (!cantidadCalificaciones.isNullOrEmpty) {
			listaFiltrada =listaFiltrada.filter[calificacion|calificacion.calificaciones.toString.equals(cantidadCalificaciones)].toList
		}
		listaFiltrada
	}

}
