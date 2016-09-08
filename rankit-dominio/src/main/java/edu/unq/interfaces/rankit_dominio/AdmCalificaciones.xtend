package edu.unq.interfaces.rankit_dominio

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class AdmCalificaciones {
	List<Calificacion> listaCalificaciones = new ArrayList


def  getCalificacionesRegistradas(){
	listaCalificaciones.size
}

def getCalificacionesOfensivas(){
	listaCalificaciones.filter[calificacion | calificacion.isContenidoOfensivo].toList.size
}
def agregarCalificacion( Calificacion calificacion){
	listaCalificaciones.add(calificacion)
}
<<<<<<< HEAD
def ratingPromedio(Puntuable puntuable){
   
   puntajeDelPuntuable(puntuable)/cantidadDeCalificacionesDelPuntuable(puntuable)
}
def calificacionesDelPutuable(Puntuable puntuable){
	listaCalificaciones.filter[calificacion | calificacion.isPuntuableBuscado(puntuable)] 
}
def cantidadDeCalificacionesDelPuntuable(Puntuable puntuable){
	calificacionesDelPutuable(puntuable).size
}
def puntajeDelPuntuable(Puntuable puntuable){
	calificacionesDelPutuable(puntuable).fold(0, [ acumulador, calificacion | acumulador + calificacion.puntos])
}
=======
def eliminarCalificacion( Calificacion calificacion){
	listaCalificaciones.remove(calificacion)
}

>>>>>>> 7e1cf24355b7bafc27640e14f741a0a1a745b35c

}