package edu.unq.interfaces.rankit_Interfaz

import appModels.CalificacionAppModel
import appModels.LugarAppModel
import appModels.RankITAppModel
import appModels.ServicioAppModel
import appModels.UsuarioAppModel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow

class Menu extends SimpleWindow<RankITAppModel> {

	new(RankITApplication application, RankITAppModel model) {
		super(application, model)
	}

	override createContents(Panel mainPanel) {
		this.title = "Rank-IT"
		contenedorMensaje(mainPanel)
		contenedorBotonera(mainPanel)
		contenedorEstado(mainPanel)
	}

	def contenedorEstado(Panel mainPanel) {
		val botoneraPanel = new Panel(mainPanel)

		botoneraPanel.layout = new ColumnLayout(4)

		new Label(botoneraPanel) => [
			bindValueToProperty("resumenSituacionUsuario")
		]
		new Label(botoneraPanel) => [
			bindValueToProperty("resumenSituacionCalificacion")
		]
		new Label(botoneraPanel) => [
			bindValueToProperty("resumenSituacionServicio")
		]
		new Label(botoneraPanel) => [
			bindValueToProperty("resumenSituacionLugar")
		]

	}

	private def contenedorBotonera(Panel mainPanel) {

		val botoneraPanel = new Panel(mainPanel)

		botoneraPanel.layout = new ColumnLayout(4)

		new Button(botoneraPanel) => [
			caption = "Adm. Usuarios"
			onClick [|
				new AdmUsuarioWindow(this, new UsuarioAppModel(
					this.modelObject.rankit.admUsuarios,
					this.modelObject.rankit.admCalificaciones,
					this.modelObject.rankit.admLugares,
					this.modelObject.rankit.admServicios,
					this.modelObject.rankit.usuarioLogeado
				)).open
			]
		]
		new Button(botoneraPanel) => [
			caption = "Adm. Calificaciones"
			onClick [|

				val CalificacionAppModel calAppModel = new CalificacionAppModel(
					this.modelObject.rankit.admCalificaciones,
					this.modelObject.rankit.admLugares,
					this.modelObject.rankit.admServicios,
					this.modelObject.rankit.usuarioLogeado
				)

				// var   nuevoAdapter = new AdapterCalificacionAppModel(calAppModel)
				new AdmCalificacionWindow(
					this,
					calAppModel
				).open
			]
		]
		new Button(botoneraPanel) => [
			caption = "Adm. Servicios"
			onClick [|
				val ServicioAppModel servicioAppModel = new ServicioAppModel(
					this.modelObject.rankit.admServicios,
					this.modelObject.rankit.admLugares,
					this.modelObject.rankit.admCalificaciones,
					this.modelObject.rankit.usuarioLogeado
				)

				new AdmPuntuableWindow(
					this,
					servicioAppModel
				).open
			]

		]
		new Button(botoneraPanel) => [
			caption = "Adm. Lugares"
			onClick [|

				val LugarAppModel lugarAppModel = new LugarAppModel(
					this.modelObject.rankit.admLugares,
					this.modelObject.rankit.admServicios,
					this.modelObject.rankit.admCalificaciones,
					this.modelObject.rankit.usuarioLogeado
				)

				new AdmPuntuableWindow(
					this,
					lugarAppModel
				).open
			]
		]
	}

	private def contenedorMensaje(Panel mainPanel) {
		val labelPanel = new Panel(mainPanel)

		labelPanel.layout = new VerticalLayout

		new Label(labelPanel) => [
			text = "Rank-IT! Módulo de administración"
			fontSize = 14
		// width = 10
		]

		new Label(labelPanel) => [
			text = "Desde este modulo vas a poder gestionar los datos y opciones de la aplicacion,"
			fontSize = 14
		// width = 500
		]

		new Label(labelPanel) => [
			text = "como sos una persona de confianza vas a tener acceso a todo!"
			fontSize = 14
		// width = 500
		]
		new Label(labelPanel) => [
			text = "Siempre acordate: Con un gran poder viene una gran responsabilidad "
			fontSize = 14
		// width = 500
		]
	}

	override protected addActions(Panel actionsPanel) {
	}

	override protected createFormPanel(Panel mainPanel) {
	}

}
