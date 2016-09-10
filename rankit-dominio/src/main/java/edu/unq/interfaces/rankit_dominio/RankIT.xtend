package edu.unq.interfaces.rankit_dominio
import org.uqbar.commons.utils.Observable

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
@Observable
@Accessors
	
class RankIT {

	private var List<Usuario>usuarios
	private var AdmCalificaciones admCalificaciones;
	private var AdmPuntuables admPuntuables;
	private var Usuario usuarioLogeado;
 //Constructor
	 new(){
		this.usuarios= newArrayList	
	}

	
	
	def void agregarUsuario(Usuario usuario){
		usuarios.add(usuario);
	}
}
		