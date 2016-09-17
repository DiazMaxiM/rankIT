package edu.unq.interfaces.rankit_Interfaz

import org.uqbar.arena.windows.WindowOwner
import edu.unq.interfaces.rankit_dominio.GenericaAppModel
import edu.unq.interfaces.rankit_dominio.AdapterLugarAppModel
import edu.unq.interfaces.rankit_dominio.Puntuable
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.Panel
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.tables.Column
import java.text.SimpleDateFormat

class AdmPuntuableWindow extends VistaGenericaWindow {
	
	new(WindowOwner parent, AdapterLugarAppModel model) {
		super(parent, model)
	}
	
	override tabla(Panel panel) {

		new Table<Puntuable>(panel, typeof(Puntuable)) => [
			// bindeamos el contenido de la tabla
			(items <=> "miAppModel.elementos")
			value <=> "miAppModel.puntuableSeleccionado"
			// le definimos el alto y ancho, esto es opcional
			width = 200
			// describimos cada fila
			// para esto definimos las celdas de cada filar
			// it es la grilla de resultados 
			new Column<Puntuable>(it) => [
				title = "Fecha De Registro" // el nombre de la columna
				fixedSize = 150 // el tamaño que va a tener
				bindContentsToProperty("fechaDeRegistro").transformer = [ fecha |
					new SimpleDateFormat("dd/MM/YYYY HH:mm").format(fecha)
				]
			// la propiedad que mostramos del objeto que está atrás de la fila 
			]

			new Column<Puntuable>(it) => [
				title = "Nombre" // el nombre de la columna
				fixedSize = 150 // el tamaño que va a tener
				bindContentsToProperty("nombre")
			// la propiedad que mostramos del objeto que está atrás de la fila 
			]

			new Column<Puntuable>(it) => [
				title = "Habilitado" // el nombre de la columna
				fixedSize = 150 // el tamaño que va a tener
				bindContentsToProperty("habilitado").transformer = [ Boolean isHabilitado |
					if(isHabilitado) "SI" else "NO"
				]
			// la propiedad que mostramos del objeto que está atrás de la fila 
			]
		]
	}
}