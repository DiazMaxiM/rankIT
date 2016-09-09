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
def eliminarCalificacion( Calificacion calificacion){
	listaCalificaciones.remove(calificacion)
}


}