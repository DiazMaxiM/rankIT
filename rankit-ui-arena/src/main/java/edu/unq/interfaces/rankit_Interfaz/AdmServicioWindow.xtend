package edu.unq.interfaces.rankit_Interfaz

import edu.unq.interfaces.rankit_dominio.CalificacionAppModel
import edu.unq.interfaces.rankit_dominio.Puntuable
import edu.unq.interfaces.rankit_dominio.PuntuableAppModel
import java.text.SimpleDateFormat
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class AdmServicioWindow extends AdmLugarWindow {

	new(WindowOwner parent, PuntuableAppModel model) {
		super(parent, model)
	}

	override puntuablesDesHabilitados(Panel panel) {
		new Label(panel) => [
			text = "Deshabilitados: "
		]

		new Label(panel) => [
			bindValueToProperty("serviciosDeshabilitados")
		]
	}

	override puntuablesHabilitados(Panel panel) {
		new Label(panel) => [
			text = "Habilitados: "

		]
		new Label(panel) => [
			bindValueToProperty("serviciosHabilitados")
		]
	}

	override puntuablesInscriptos(Panel panel) {
		new Label(panel) => [
			text = "Servicios Inscriptos: "
		]
		new Label(panel) => [
			bindValueToProperty("serviciosInscriptos")
		]
	}

	override titulo(Panel panel) {
		var panelTitulo = new Panel(panel)
		panelTitulo.layout = new ColumnLayout(2)
		new Label(panelTitulo) => [
			text = "Servicios"
			fontSize = 15
		]
	}

	override ingresarDatosYBuscar(Panel panel) {
		var panelDatos = new Panel(panel)
		panelDatos.layout = new ColumnLayout(3)
		new Label(panelDatos).text = "Buscar por nombre de Servicio:"
		new TextBox(panelDatos) => [
			bindValueToProperty("nombreDelServicioBuscado")

			width = 100
		]

		new Button(panelDatos) => [
			caption = "Buscar"
			width = 100
			onClick([|modelObject.buscarPorNombreDeServicio]).setAsDefault.disableOnError
		]
	}

	override botones(Panel panel) {
		new Button(panel) => [
		     caption = "Revisar Calificaciones"
		      bindEnabledToProperty("hayPuntuableSeleccionado")
		      width = 200
		      
		      onClick [ |
					new AdmCalificacionWindow(
					this,
					new CalificacionAppModel(this.modelObject.administradorCalificacion,
											 this.modelObject.administradorDePuntuables,
											 this.modelObject.usuarioLogeado).
											 filtradoObligatorioPorPuntuable(this.modelObject.puntuableSeleccionado)).open
						]
						
						]
	         new Button(panel) => [
		      caption = "Eliminar"
		      bindEnabledToProperty("hayPuntuableSeleccionado")
		      width = 200
		      onClick [| 
			 	this.modelObject.eliminarServicio
			 ]
			 
			 ]
		     
	}

	override contenedorTabla(Panel panel) {

		val panelTabla = new Panel(panel)
		new Table<Puntuable>(panelTabla, typeof(Puntuable)) => [
			// bindeamos el contenido de la tabla
			(items <=> "administradorDePuntuables.servicios")
			value <=> "puntuableSeleccionado"
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

	override panelBotones(Panel panel) {
		val panelBotones = new Panel(panel)
		new Button(panelBotones) => [
			caption = "Nuevo"
			onClick [|
				this.modelObject.nuevoServicio
			]
		]
	}

}
