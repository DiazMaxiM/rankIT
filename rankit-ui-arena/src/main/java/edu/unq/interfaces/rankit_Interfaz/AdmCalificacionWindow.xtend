package edu.unq.interfaces.rankit_Interfaz

import edu.unq.interfaces.component.LabeledTextBox

import edu.unq.interfaces.rankit_dominio.Calificacion
import edu.unq.interfaces.rankit_dominio.Puntuable
import edu.unq.interfaces.rankit_dominio.Usuario
import java.text.SimpleDateFormat
import org.uqbar.arena.bindings.DateTransformer
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import edu.unq.interfaces.rankit_dominio.CalificacionAppModel

class AdmCalificacionWindow extends VistaGenericaWindow {

	new(WindowOwner parent, CalificacionAppModel model) {
		super(parent, model)
	}

	override contenedorParaSegundoParametroCalificacion(Panel panelBusquedaParametros) {
		new LabeledTextBox(panelBusquedaParametros) => [
			text = this.modelObject.textoSegundoParametroDeBusqueda
			bindValueToProperty("segundoParametroDeBusqueda")
		]
	}

	override mostrarInformacionDelItem(Panel panel) {
		val contenedorOpciones = new Panel(panel)
		contenedorOpciones.layout = new VerticalLayout

		new ErrorsPanel(contenedorOpciones, "")

		new Label(contenedorOpciones) => [
			text = "Evaluado"
		]
		new Selector(contenedorOpciones) => [
			bindEnabledToProperty("hayItemSeleccionado")
			bindItemsToProperty("puntuables").adapter = new PropertyAdapter(Puntuable, "nombre")
			bindValueToProperty("itemSeleccionado.evaluado")
		]

		val contenedorFechaYUsuario = new Panel(contenedorOpciones)
		contenedorFechaYUsuario.layout = new VerticalLayout

		val contenedorFecha = new Panel(contenedorFechaYUsuario)
		contenedorFecha.layout = new HorizontalLayout
		val contenedorFechaColumna = new Panel(contenedorFecha)
		contenedorFechaColumna.layout = new ColumnLayout(2)

		new Label(contenedorFechaColumna) => [
			text = "Fecha:"
		]
		new Label(contenedorFechaColumna) => [
			bindEnabledToProperty("hayItemSeleccionado")

			bindValueToProperty("itemSeleccionado.fecha").transformer = new DateTransformer => [
				pattern = "dd/MM/yyyy HH:mm"
			];
		]

		val contenedorUsuarioColumna = new Panel(contenedorFecha)
		contenedorUsuarioColumna.layout = new ColumnLayout(2)

		new Label(contenedorFechaColumna) => [
			text = "Usuario:"
		]
		new Label(contenedorFechaColumna) => [
			bindEnabledToProperty("hayItemSeleccionado")
			bindValueToProperty("itemSeleccionado.evaluado.nombre") // .transformer = [ fecha | new SimpleDateFormat("dd/MM/YYYY").format(fecha)]
		]

		new Label(contenedorOpciones) => [
			text = "Puntaje:"
		]
		new NumericField(contenedorOpciones) => [
			bindEnabledToProperty("hayItemSeleccionado")
			bindValueToProperty("puntos")
		]
		new Label(contenedorOpciones) => [
			text = "Detalle:"
		]
		new TextBox(contenedorOpciones) => [
			bindEnabledToProperty("hayItemSeleccionado")
			bindValueToProperty("itemSeleccionado.detalle") // .transformer = [ fecha | new SimpleDateFormat("dd/MM/YYYY").format(fecha)]
			height = 50
		]

		val contenedorContOfensivo = new Panel(contenedorOpciones)
		contenedorContOfensivo.layout = new VerticalLayout

		val contenedorContOfensivoHorizontal = new Panel(contenedorContOfensivo)
		contenedorFecha.layout = new HorizontalLayout
		val contenedorContOfensivoHorizontalColumna = new Panel(contenedorContOfensivoHorizontal)
		contenedorContOfensivoHorizontalColumna.layout = new ColumnLayout(2)
		new CheckBox(contenedorContOfensivoHorizontalColumna) => [
			bindValueToProperty("contenidoOfensivo") // .transformer = [ fecha | new SimpleDateFormat("dd/MM/YYYY").format(fecha)]
			bindEnabledToProperty("hayItemSeleccionado")
		]
		new Label(contenedorContOfensivoHorizontalColumna) => [
			text = "Contenido Ofensivo"
		]
	}

	override void tabla(Panel panel) {
		new Table<Calificacion>(panel, typeof(Calificacion)) => [
			// bindeamos el contenido de la tabla
			(items <=> "listaCalificacionesFiltradas")
			value <=> "itemSeleccionado"
			// le definimos el alto y ancho, esto es opcional
			width = 400
			height = 400
			// describimos cada fila
			// para esto definimos las celdas de cada fila
			// la lotería de la que vamos a hablar
			// it es la grilla de resultados 
			new Column<Calificacion>(it) => [
				title = "Evaluado" // el nombre de la columna
				// fixedSize = 150   //el tamaño que va a tener
				bindContentsToProperty("evaluado").transformer = [Puntuable puntuable|puntuable.nombre]
			// la propiedad que mostramos del objeto que está atrás de la fila 
			]
			// el numero que salió en la loteria 
			new Column<Calificacion>(it) => [
				title = "Ptos"
				// fixedSize = 150
				bindContentsToProperty("puntos")
			]
			new Column<Calificacion>(it) => [
				title = "Fecha" // el nombre de la columna
				fixedSize = 150 // el tamaño que va a tener
				bindContentsToProperty("fecha").transformer = [ fecha |
					new SimpleDateFormat("dd/MM/YYYY HH:mm").format(fecha)
				] // la propiedad que mostramos del objeto que está atrás de la fila 
			]
			// el numero que salió en la loteria 
			new Column<Calificacion>(it) => [
				title = "User"
				fixedSize = 150
				bindContentsToProperty("usuario").transformer = [Usuario usuario|usuario.nombre]
			]
			new Column<Calificacion>(it) => [
				title = "Es Ofensiva"
				fixedSize = 150
				bindContentsToProperty("contenidoOfensivo").transformer = [esOfensivo|if(esOfensivo) "Si" else "No"]
			]
		]

	}
	
	override botonParaMostrarCalificacionesDelItem(Panel panel){
		
	}
	
	override mostrarNombreDelItem(Panel panel) {
		//throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	

}
