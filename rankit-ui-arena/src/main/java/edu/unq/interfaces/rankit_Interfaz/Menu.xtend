package edu.unq.interfaces.rankit_Interfaz

import edu.unq.interfaces.rankit_dominio.RankIT
import edu.unq.interfaces.rankit_dominio.RankITAppModel
import edu.unq.interfaces.rankit_dominio.Usuario
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import edu.unq.interfaces.rankit_dominio.CalificacionAppModel
import edu.unq.interfaces.rankit_dominio.AdmCalificaciones
import edu.unq.interfaces.rankit_dominio.PuntuableAppModel
import edu.unq.interfaces.rankit_dominio.UsuarioAppModel
import edu.unq.interfaces.rankit_dominio.AdmUsuarios

class Menu extends SimpleWindow<RankITAppModel> {
	
	
	new(RankITApplication application, RankITAppModel model) {
		super(application,model)
		}
	
	override createContents(Panel mainPanel) {
		this.title = "Rank-IT"
		contenedorMensaje  (mainPanel)			
		contenedorBotonera (mainPanel)			
		//contenedorEstado   (mainPanel)
	}
	
	def contenedorEstado(Panel mainPanel) {
		val botoneraPanel = new Panel(mainPanel)
		
		botoneraPanel.layout = new ColumnLayout(4)
		
		new Label(botoneraPanel)=> [
			bindValueToProperty("estadoUsuario")
		]
		new Label(botoneraPanel)=> [
			bindValueToProperty("estadoCalificacion")
		]
		new Label(botoneraPanel)=> [
			bindValueToProperty("estadoServicio")
		]
		new Label(botoneraPanel)=> [
			bindValueToProperty("estadoLugar")
		]
	}
	
	private def contenedorBotonera(Panel mainPanel) {
	
		val botoneraPanel = new Panel(mainPanel)
		
		botoneraPanel.layout = new ColumnLayout(4)
		
		new Button(botoneraPanel) => [
				caption = "Adm. Usuarios"
				onClick [ | new AdmUsuarioWindow(this,new UsuarioAppModel(this.modelObject.rankit.admUsuarios)).open ]
		]
		new Button(botoneraPanel) => [
				caption = "Adm. Calificaciones"
				onClick [|new AdmCalificacionWindow(this,new CalificacionAppModel(
															this.modelObject.rankit.admCalificaciones,
															this.modelObject.rankit.admPuntuables,
															this.modelObject.rankit.usuarioLogeado
																		   		)
													).open ]
			]
		new Button(botoneraPanel) => [
				caption = "Adm. Servicios"
				onClick [|new AdmServicioWindow(this,new PuntuableAppModel(
								this.modelObject.rankit.admPuntuables,
								this.modelObject.rankit.admCalificaciones)).open ]
			]
		new Button(botoneraPanel) => [
				caption = "Adm. Lugares"
				onClick [|new AdmLugarWindow(this,new PuntuableAppModel(
								this.modelObject.rankit.admPuntuables,
								this.modelObject.rankit.admCalificaciones)).open ]
			]
	}
	
	private def contenedorMensaje(Panel mainPanel) {
		val labelPanel = new Panel(mainPanel)
		
		labelPanel.layout = new VerticalLayout
			
			
			new Label(labelPanel)=> [
				text = "Rank-IT! Módulo de administración"
				fontSize = 14
				//width = 10
			]
			
			new Label(labelPanel)=> [
				text = "Desde este modulo vas a poder gestionar los datos y opciones de la aplicacion,"
				fontSize = 14
				//width = 500
			]
			
			new Label(labelPanel)=> [
				text = "como sos una persona de confianza vas a tener acceso a todo!"
				fontSize = 14
				//width = 500
			]
			new Label(labelPanel)=> [
				text = "Siempre acordate: Con un gran poder viene una gran responsabilidad "
				fontSize = 14
				//width = 500
			]
	}
	
	
	override protected addActions(Panel actionsPanel) {
	}
	
	override protected createFormPanel(Panel mainPanel) {
	}
	
}