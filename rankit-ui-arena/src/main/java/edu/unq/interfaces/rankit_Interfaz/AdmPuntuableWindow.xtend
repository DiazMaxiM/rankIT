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
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.layout.HorizontalLayout
import edu.unq.interfaces.component.LabelCheckBox
import edu.unq.interfaces.rankit_dominio.AdapterCalificacionAppModel
import edu.unq.interfaces.rankit_dominio.CalificacionAppModel

class AdmPuntuableWindow extends VistaGenericaWindow {

	
	new(WindowOwner parent, GenericaAppModel model) {
		super(parent, model)
	}
	
	override tabla(Panel panel) {

		new Table<Puntuable>(panel, typeof(Puntuable)) => [
			// bindeamos el contenido de la tabla
			(items <=> "miAppModel.elementos")
			value <=> "miAppModel.itemSeleccionado"
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
	
	  override  mostrarInformacionDelItem(Panel panel) {
		this.editarNombre(panel)
		this.habilitarPuntuable(panel)
		this.calificacionesPuntuable(panel)
	}

	override mostrarNombreDelItem(Panel panel) {
		var panelNombre = new Panel(panel)
		panelNombre.layout = new ColumnLayout(2)
		new Label(panelNombre) => [
			text = "Nombre: "
			fontSize = 13
		]
		new Label(panelNombre) => [
			value <=> "miAppModel.nombre"
			fontSize = 13
		]
	}

	def editarNombre(Panel panel) {
		new Label(panel).text = "Nombre:"
		new TextBox(panel) => [
			bindEnabledToProperty("miAppModel.hayItemSeleccionado")
			bindValueToProperty("miAppModel.nombre")
		]

	}

	def habilitarPuntuable(Panel panel) {
		var panelHabilitar = new Panel(panel)
		panelHabilitar.layout = new HorizontalLayout
		new LabelCheckBox(panelHabilitar).setText("Habilitado")
		    .bindEnabledToProperty("miAppModel.hayItemSeleccionadoConNombre").
			bindValueToProperty("miAppModel.habilitado")
			

	}

	def calificacionesPuntuable(Panel panel) {
		this.rating(panel)
		this.calificaciones(panel)

	}

	def rating(Panel panel) {
		var panelRating = new Panel(panel)
		panelRating.layout = new HorizontalLayout
		new Label(panelRating).text = "Ranting promedio:"
		new Label(panelRating) => [
			bindEnabledToProperty("miAppModel.hayItemSeleccionado")
			bindValueToProperty("miAppModel.ratingPromedio")
		]

	}

	def calificaciones(Panel panel) {
		var panelCalificaciones = new Panel(panel)
		panelCalificaciones.layout = new HorizontalLayout
		new Label(panelCalificaciones).text = "Calificaciones:"
		new Label(panelCalificaciones) => [
			bindEnabledToProperty("miAppModel.hayItemSeleccionado")
			bindValueToProperty("miAppModel.cantidadDeCalificacionesDelPuntuable")
		]

	}
	
	

}