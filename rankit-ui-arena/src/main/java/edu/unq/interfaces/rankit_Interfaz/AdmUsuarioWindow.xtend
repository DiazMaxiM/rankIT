package edu.unq.interfaces.rankit_Interfaz

import appModels.UsuarioAppModel
import edu.unq.interfaces.component.LabelCheckBox
import edu.unq.interfaces.rankit_dominio.Usuario
import java.text.SimpleDateFormat
import org.uqbar.arena.bindings.DateTransformer
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class AdmUsuarioWindow extends VistaGenericaWindow {

	new(WindowOwner parent, UsuarioAppModel modelo) {
		super(parent, modelo)
		title = "Rank-IT -->Adm Usuarios"
	}

	override mostrarNombreDelItem(Panel panel) {
		var nombreDeUsuario = new Panel(panel)
		nombreDeUsuario.layout = new ColumnLayout(2)
		new Label(nombreDeUsuario) => [text = "Nombre:" fontSize = 15]
		new TextBox(nombreDeUsuario) => [
			bindEnabledToProperty("hayItemSeleccionado")
			bindValueToProperty("nombre")
		]

	}

	override mostrarInformacionDelItem(Panel panel) {
		edicionDeFechaDeRegistro(panel)
		edicionDeCasillas(panel)
		ultimaPublicacionDelUsuario(panel)

	}

	def edicionDeFechaDeRegistro(Panel panelDeEdicion) {
		new Label(panelDeEdicion).text = "Fecha de registro:"
		new TextBox(panelDeEdicion) => [
			bindEnabledToProperty("hayItemSeleccionado")
			bindValueToProperty("fechaDeRegistroDelUsuario").transformer = new DateTransformer
		]
	}

	def edicionDeCasillas(Panel panel) {
		var casillas = new Panel(panel)
		casillas.layout = new VerticalLayout
		casillaActivo(casillas)
		casillaBaneado(casillas)
	}

	def casillaActivo(Panel panel) {
		var usuarioActivo = new Panel(panel)
		usuarioActivo.layout = new HorizontalLayout
		new LabelCheckBox(usuarioActivo).setText("Activo").bindEnabledToProperty("hayItemSeleccionado").
			bindValueToProperty("activo")
	}

	def casillaBaneado(Panel panel) {
		var usuarioBaneado = new Panel(panel)
		usuarioBaneado.layout = new HorizontalLayout
		new LabelCheckBox(usuarioBaneado).setText("Baneado").bindEnabledToProperty("hayItemSeleccionado").
			bindValueToProperty("baneado")
	}

	def ultimaPublicacionDelUsuario(Panel panelDeEdicion) {
		var panel = new Panel(panelDeEdicion)
		panel.layout = new HorizontalLayout
		new Label(panel).text = "Ultima publicacion:"
		new Label(panel) => [
			bindEnabledToProperty("hayItemSeleccionado")
			bindValueToProperty("fechaDeLaUltimaPublicacion").transformer = new DateTransformer
		]
	}

	override botonParaBlanquearUsuarios(Panel panel) {
		new Button(panel) => [
			caption = "Blanquear clave"
			bindEnabledToProperty("hayItemSeleccionado")
			onClick [|this.modelObject.blanquearContrasenha
				new InformacionWindow(this, this.modelObject).open
			]
			width = 150
		]

	}

	override tabla(Panel panel) {
		val tabla = new Panel(panel)
		tabla.layout = new VerticalLayout
		new Table<Usuario>(tabla, typeof(Usuario)) => [
			// Bindeamos el contenido de la tabla
			(items <=> "usuarios")
			value <=> "itemSeleccionado"
			width = 300 // Le definimos el alto y ancho, esto es opcional
			height = 500
			// A continuacion describimos cada fila definiendo las celdas de cada fila
			// it es la grilla de resultados 
			new Column<Usuario>(it) => [
				title = "Fecha De Registro" // Nombre de la columna
				fixedSize = 150 // Tamaño que va a tener
				bindContentsToProperty("fechaDeRegistro").transformer = [fechaDeRegistro |
					new SimpleDateFormat("dd/MM/YYYY HH:mm").format(fechaDeRegistro)
				]
			// La propiedad que mostramos del objeto que está atrás de la fila 
			]

			new Column<Usuario>(it) => [
				title = "Nombre" // El nombre de la columna
				fixedSize = 100 // El tamaño que va a tener
				bindContentsToProperty("nombre")
			]

			new Column<Usuario>(it) => [
				title = "Activo"
				fixedSize = 100
				bindContentsToProperty("activo").transformer = [esActivo|if(esActivo) "Sí" else "No"]
			]

			new Column<Usuario>(it) => [
				title = "Baneado"
				fixedSize = 100
				bindContentsToProperty("baneado").transformer = [estaBaneado|if(estaBaneado) "Sí" else "-"]
			]
		]
	}
}
