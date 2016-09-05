package edu.unq.interfaces.rankit_Interfaz

import edu.unq.interfaces.rankit_dominio.RankIT
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import edu.unq.interfaces.rankit_dominio.Usuario
import edu.unq.interfaces.rankit_dominio.Lugar

class Menu extends MainWindow<RankIT> {
	
	new() {
		super(new RankIT)
	}
	new(RankIT rankit) {
		super(rankit)
	}
	
	override createContents(Panel mainPanel) {
		this.title = "Rank-IT"
		contenedorMensaje  (mainPanel)			
		contenedorBotonera (mainPanel)			
		contenedorEstado   (mainPanel)
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
				onClick [ | new AdmUsuarioWindow(this,new Usuario()).open ]
		]
		new Button(botoneraPanel) => [
				caption = "Adm. Calificaciones"
				onClick [|new AdmCalificacionWindow(this,null).open ]
			]
		new Button(botoneraPanel) => [
				caption = "Adm. Servicios"
				//onClick [|new AdmLugarWindow(this,new Usuario()).open ]
			]
		new Button(botoneraPanel) => [
				caption = "Adm. Lugares"
				onClick [|new AdmLugarWindow(this,new RankIT()).open ]
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
	
	def static main(String[] args) {
		
		val prueba = new RankIT()
		val usuario=new Usuario()
		usuario.activo=true
		prueba.usuarios.add(usuario)
		
		
		new Menu(prueba).startApplication
	}
}