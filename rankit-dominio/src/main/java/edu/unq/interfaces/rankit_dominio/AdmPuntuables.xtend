package edu.unq.interfaces.rankit_dominio

import com.google.common.base.Strings
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class AdmPuntuables {
	List<Puntuable> puntuables = new ArrayList
	private int secuenciaId=1
	/**
	 * @param puntuable representa al puntuable que se desea agregar a la lista de puntuables
	 */
	def void agregar(Puntuable puntuable) {
		puntuable.id=secuenciaId
		secuenciaId+=1
		puntuables.add(puntuable)
	}

	/**
	 * @param puntuable representa al puntuable que se desea eliminar a la lista de puntuables
	 */
	def void eliminar(Puntuable puntuable) {
		puntuables.remove(puntuable)
	}

	/**
	 * @return int retorna la cantidad de puntuables inscriptos
	 */
	def int inscriptos() {
		puntuables.size
	}

	/**
	 * @return int retorna  la cantidad de puntuables habilitados
	 */
	def int habilitados() {
		puntuables.filter[puntuable|puntuable.isHabilitado].toList.size
	}

	/**
	 * @return int retorna  la cantidad de puntuables deshabilitados
	 */
	def int deshabilitados() {
		inscriptos() - habilitados()
	}

	/**
	 * paran letras representa las letras del puntuable que se desea buscar 
	 * @return List<Puntuable> retorna los puntuaables que contiene las letras ingresadas
	 */
	def List<Puntuable> buscarPuntuables(String letras) {
		if (!estaVacio(letras)) {
			puntuablesConLasLetras(letras)
		} else {
			puntuables
		}
	}

	/**
	 * @param data data String
	 * @return Boolean retorna true si es null o empty el string ingresado
	 */
	private def boolean estaVacio(String data) {
		Strings.isNullOrEmpty(data)
	}

	/**
	 * @param nombre representa el nombre del puntuable que se desea buscar
	 * @return List<Puntuable> retorna los puntuaables que contiene el nombre buscado
	 */
	private def List<Puntuable> puntuablesConElNombre(String nombre) {
		puntuables.filter[puntuable|puntuable.tieneElNombre(nombre)].toList
	}

	/**
	 * paran letras representa las letras del puntuable que se desea buscar 
	 * @return List<Puntuable> retorna los puntuaables que contiene las letras ingresadas
	 */
	private def List<Puntuable> puntuablesConLasLetras(String nombre) {
		puntuables.filter[puntuable|puntuable.nombreContieneLasLetras(nombre)].toList

	}

	/**
	 * @paran nombre representa el nombre nuevo que se quiere cambiar al puntuable
	 * @return void cambia el nombre del puntuaable en el caso de no tener un nombre o estar de no 
	 * estar el nombre duplicado
	 */
	def void cambiarNombreSiPuedeDelPuntuable(Puntuable puntuable, String nombre) {
		if (puedoCambiarElNombreDelPuntuable(nombre)) {
			puntuable.nombre = nombre
		}
	}
	/**
	 * @paran nombre representa el nombre nuevo que se quiere cambiar al puntuable
	 * @return bool indica si se le puede cambiar el nombre a un puntuable
	 */

	private def boolean puedoCambiarElNombreDelPuntuable(String nombre) {
		!(nombreVacio(nombre) || hayUnPuntuableConElNombre(nombre))
	}

	/**
	 * @paran nombre representa al nombre que se verifica si esta vacio  
	 * @return boolean verifica si el nombre no esta vacio, en caso de estar vacio tira una UserException
	 */
	private def boolean nombreVacio(String nombre) {
		if (estaVacio(nombre)) {
			throw new UserException("Por favor defina un nombre")
		}
		estaVacio(nombre)
	}

	/**
	 * @paran nombre representa al nombre con el que se consulta si existe otro puntuable con ese mismo nombre
	 * @return boolean verifica si el nombre no esta usado en otro puntuable, en caso de estarlo tira una UserException
	 */
	private def boolean hayUnPuntuableConElNombre(String nombre) {
		if (hayPuntuableConElNombre(nombre)) {
			throw new UserException("Ya existe otro Servicio con el nombre " + nombre)
		}
		hayPuntuableConElNombre(nombre)
	}

	/**
	 * @paran nombre representa al nombre con el que se consulta si existe otro puntuable con ese mismo nombre
	 * @return boolean verifica si existe un puntuable con el nombre ingresado
	 */
	private def boolean hayPuntuableConElNombre(String nombre) {
		!(puntuablesConElNombre(nombre).empty)
	}
		
	def getPuntuablesBasicos(TipoDePuntuable tipo) {
		var List<PuntuablesBasicos> listaPuntuableBasico = new ArrayList
		for(puntuable : this.puntuables){
			listaPuntuableBasico.add(new PuntuablesBasicos(puntuable,tipo))
		}	
		listaPuntuableBasico		
	}
	
	def TipoDePuntuable tipo(PuntuableAbstracto abstracto) {
		     abstracto.tipo
	}
	
}
