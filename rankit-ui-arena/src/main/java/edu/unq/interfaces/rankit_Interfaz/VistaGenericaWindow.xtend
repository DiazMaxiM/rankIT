package edu.unq.interfaces.rankit_Interfaz

import appModels.GenericaAppModel
import edu.unq.interfaces.component.LabelConDatos
import edu.unq.interfaces.component.LabeledTextBox
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

abstract class VistaGenericaWindow extends SimpleWindow<GenericaAppModel> {

	new(WindowOwner parent, GenericaAppModel model) {
		super(parent, model)
		title = "Rank-IT"
	}

	override protected addActions(Panel actionsPanel) {
	}

	override protected createFormPanel(Panel mainPanel) {
		val panelGeneral = new Panel(mainPanel)
		panelGeneral.layout = new VerticalLayout
		titulo(panelGeneral)
		contenedorResumenDeSituacion(panelGeneral)
		contenedorBusqueda(panelGeneral)
		contenedorTablaYEdicion(panelGeneral)
	}

	def titulo(Panel panel) {
		val panelTitulo = new Panel(panel)
		panelTitulo.layout = new HorizontalLayout
		new Label(panelTitulo) => [text = "Resumen de situación:" fontSize = 20]

	}

	def contenedorBusqueda(Panel panelGeneral) {
		tituloContenedorBusqueda(panelGeneral)
		val panelBusqueda = new Panel(panelGeneral)
		panelBusqueda.layout = new HorizontalLayout

		val panelBusquedaParametros = new Panel(panelGeneral)
		panelBusquedaParametros.layout = new HorizontalLayout

		new LabeledTextBox(panelBusquedaParametros) => [
			text = this.modelObject.textoPrimerParametroDeBusqueda
			bindValueToProperty("primerParametroDeBusqueda")
		]
		contenedorParaSegundoParametroCalificacion(panelBusquedaParametros)
	}

	def void tituloContenedorBusqueda(Panel panelBusqueda) {
		val panelTitulo = new Panel(panelBusqueda)
		panelTitulo.layout = new HorizontalLayout
		new Label(panelTitulo) => [text = this.modelObject.tituloContenedorBusqueda fontSize = 16]

	}

	def contenedorParaSegundoParametroCalificacion(Panel panelBusquedaParametros) {
	}

	def contenedorResumenDeSituacion(Panel panelGeneral) {
		val panelResumen = new Panel(panelGeneral)
		panelResumen.layout = new HorizontalLayout

		dato1ResumenDeSituacion(panelResumen)
		dato2ResumenDeSituacion(panelResumen)
		dato3ResumenDeSituacion(panelResumen)
		dato4ResumenDeSituacion(panelResumen)
	}

	def dato1ResumenDeSituacion(Panel panelResumen) {
		new LabelConDatos(panelResumen) => [
			bindValueToPropertyLabelNombre("descripcionDato1ResumenDeSituacion")
			bindValueToPropertyLabelValor("valorDato1ResumenDeSituacion")
			datoConColorAzul
		]
	}

	def dato2ResumenDeSituacion(Panel panelResumen) {
		new LabelConDatos(panelResumen) => [
			bindValueToPropertyLabelNombre("descripcionDato2ResumenDeSituacion")
			bindValueToPropertyLabelValor("valorDato2ResumenDeSituacion")
			datoConColorAzul
		]
	}

	def dato3ResumenDeSituacion(Panel panelResumen) {
		new LabelConDatos(panelResumen) => [
			bindValueToPropertyLabelNombre("descripcionDato3ResumenDeSituacion")
			bindValueToPropertyLabelValor("valorDato3ResumenDeSituacion")
			datoConColorRojo
		]

	}

	def dato4ResumenDeSituacion(Panel panelResumen) {
		new LabelConDatos(panelResumen) => [
			bindValueToPropertyLabelNombre("descripcionDato4ResumenDeSituacion")
			bindValueToPropertyLabelValor("valorDato4ResumenDeSituacion")
			datoConColorRojo
		]
	}

	def contenedorTablaYEdicion(Panel panelGeneral) {
		val contenedorTablaYOpcionesPanel = new Panel(panelGeneral)
		contenedorTablaYOpcionesPanel.layout = new ColumnLayout(2)
		contenedorTabla(contenedorTablaYOpcionesPanel)
		contenedorOpciones(contenedorTablaYOpcionesPanel)
	}

	def contenedorOpciones(Panel panel) {
		val contenedorOpcionPanel = new Panel(panel)
		contenedorOpcionPanel.layout = new VerticalLayout
		this.mostrarNombreDelItem(contenedorOpcionPanel)
		this.panelErrores(contenedorOpcionPanel)
		this.mostrarInformacionDelItem(contenedorOpcionPanel)
		this.botonParaMostrarCalificacionesDelItem(contenedorOpcionPanel)
		this.botonParaBlanquearUsuarios(contenedorOpcionPanel)
		this.botonParaEliminarItem(contenedorOpcionPanel)
	}

	def void mostrarNombreDelItem(Panel panel)

	def panelErrores(Panel panel) {
		new ErrorsPanel(panel, "Edita la información")
	}

	def void mostrarInformacionDelItem(Panel panel)

	def botonParaMostrarCalificacionesDelItem(Panel panel) {
		new Button(panel) => [
			caption = "Revisar Calificaciones"
			bindEnabledToProperty("hayItemSeleccionadoConNombre")

			onClick [|
				new AdmCalificacionWindow(
					this,
					this.modelObject.elementosNecesariosParaAdmCalificacionWindow
				).open
			]
			width = 200
		]

	}

	def void botonParaBlanquearUsuarios(Panel panel)

	def botonParaEliminarItem(Panel panel) {
		new Button(panel) => [
			caption = "Eliminar"
			bindEnabledToProperty("hayItemSeleccionado")
			onClick[|
				val adapterAppModel = this.modelObject
				new EliminarWindow(this, adapterAppModel).open
			]
		]

	}

	def contenedorTabla(Panel panel) {
		val contenedorTablaPanel = new Panel(panel)
		contenedorTablaPanel.layout = new VerticalLayout

		tabla(contenedorTablaPanel)

		new Button(contenedorTablaPanel) => [
			caption = "Nuevo"
			onClick[|this.modelObject.nuevo]
		]

	}

	def void tabla(Panel panel)

}
