package edu.unq.interfaces.rankit_Interfaz

import edu.unq.interfaces.component.LabelConDatos
import edu.unq.interfaces.component.LabeledTextBox
import edu.unq.interfaces.component.Titulo
import edu.unq.interfaces.rankit_dominio.GenericaAppModel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

abstract class  VistaGenericaWindow extends SimpleWindow<GenericaAppModel> {

	new(WindowOwner parent, GenericaAppModel model) {
		super(parent, model)
	}

	override protected addActions(Panel actionsPanel) {
	}

	override protected createFormPanel(Panel mainPanel) {
		val panelGeneral = new Panel(mainPanel)
		panelGeneral.layout = new VerticalLayout

		new Titulo(panelGeneral, "Resumen de Situacion")

		contenedorResumenDeSituacion(panelGeneral)
		contenedorBusqueda(panelGeneral)
		contenedorTablaYEdicion(panelGeneral)
	}

	def contenedorBusqueda(Panel panelGeneral) {
		val panelBusqueda = new Panel(panelGeneral)
		panelBusqueda.layout = new HorizontalLayout

		tituloContenedorBusqueda(panelBusqueda)

		val panelBusquedaParametros = new Panel(panelGeneral)
		panelBusquedaParametros.layout = new HorizontalLayout

		new LabeledTextBox(panelBusquedaParametros) => [
			text = this.modelObject.textoPrimerParametroDeBusqueda
			bindValueToProperty("primerParametroDeBusqueda")
		]

		contenedorEspecialMaxi(panelBusquedaParametros)
	}
	
	def void tituloContenedorBusqueda(Panel panelBusqueda) {
		new Titulo(panelBusqueda, this.modelObject.tituloContenedorBusqueda)
	}

	def contenedorEspecialMaxi(Panel panelBusquedaParametros) {
		new LabeledTextBox(panelBusquedaParametros) => [
			text = this.modelObject.textoSegundoParametroDeBusqueda
			bindValueToProperty("segundoParametroDeBusqueda")
		]
	}

	def contenedorResumenDeSituacion(Panel panelGeneral) {
		val panelResumen = new Panel(panelGeneral)
		panelResumen.layout = new HorizontalLayout
		new LabelConDatos(panelResumen) => [
			bindValueToPropertyLabelNombre("labelNombre1")
			bindValueToPropertyLabelValor("labelValor1")
		]
		new LabelConDatos(panelResumen) => [
			bindValueToPropertyLabelNombre("labelNombre2")
			bindValueToPropertyLabelValor("labelValor2")
		]
		new LabelConDatos(panelResumen) => [
			bindValueToPropertyLabelNombre("labelNombre3")
			bindValueToPropertyLabelValor("labelValor3")
		]
		new LabelConDatos(panelResumen) => [
			bindValueToPropertyLabelNombre("labelNombre4")
			bindValueToPropertyLabelValor("labelValor4")
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

		opciones(contenedorOpcionPanel)

		new Button(contenedorOpcionPanel) => [
			caption = "Eliminar"
		// onClick[| this.modelObject.eliminar]
		]
	}

	def opciones(Panel panel) {
		// throw new UnsupportedOperationException("TODO: auto-generated method stub")
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

	def void tabla(Panel panel) {
		// throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
