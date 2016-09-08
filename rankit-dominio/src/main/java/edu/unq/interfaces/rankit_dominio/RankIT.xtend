package edu.unq.interfaces.rankit_dominio
import org.uqbar.commons.utils.Observable

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
@Observable
@Accessors
	
class RankIT {

	private var List<Puntuable>lugares
	private var List<Puntuable>servicios
	private var List<Usuario>usuarios
	private var AdmCalificaciones admCalificaciones;
 //Constructor
	 new(){
		this.lugares = newArrayList
		this.servicios = newArrayList
		this.usuarios= newArrayList
		
	}

	
	def void agregarUsuario(Usuario usuario){
		usuarios.add(usuario);
	}

}
		