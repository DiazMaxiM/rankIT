package edu.unq.interfaces.rankit_Interfaz

import edu.unq.interfaces.rankit_dominio.Usuario
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.widgets.CheckBox
import edu.unq.interfaces.rankit_dominio.UsuarioAppModel

class AdmUsuarioWindow extends SimpleWindow<UsuarioAppModel> 
{
	
	new(WindowOwner parent, UsuarioAppModel modelo)
	{
		super (parent, modelo)
	}
	
	override protected createFormPanel(Panel panelPrincipal) 
	{
		this.title="Rank-IT --> Adm Usuarios"
		val panel = new Panel(panelPrincipal)
		panel.layout = new VerticalLayout
		panelDeSituacionActual(panel)
		panelDeBusqueda(panel)
		panelDeTablaYOpciones(panel)
	}
	
	def panelDeTablaYOpciones(Panel panelPrincipal) 
	{
		val tablaYOpciones = new Panel(panelPrincipal)
		tablaYOpciones.layout = new ColumnLayout(2)
		panelConTablaDeResultado (tablaYOpciones)
		panelConOpcionesDeEdicion (tablaYOpciones)
		new Label(tablaYOpciones)
	}
	
	def panelConOpcionesDeEdicion(Panel panelPrincipal) 
	{
		val opcionesDeEdicion = new Panel(panelPrincipal)
		opcionesDeEdicion.layout = new VerticalLayout
		
		new Label(opcionesDeEdicion)=>[text = "Nombre:"]	
		new ErrorsPanel(opcionesDeEdicion,"")
		
		new Label(opcionesDeEdicion)=>[text = "Fecha de registro:"]
		new Label(opcionesDeEdicion)=> 
		[ bindValueToProperty ("usuarioSeleccionado.getFechaDeRegistro")]
		
		new CheckBox (opcionesDeEdicion)=>
			[bindValueToProperty ("usuarioSeleccionado.isActivo")]
		new Label(opcionesDeEdicion) => [text = "Activo"]
		new CheckBox (opcionesDeEdicion)=>
			[bindValueToProperty ("usuarioSeleccionado.isBaneado")]
		new Label(opcionesDeEdicion) => [text = "Baneado"]		
		
		new Label(opcionesDeEdicion) => [text = "Ultima publicacion"]
		new Label(opcionesDeEdicion)=> 
		[ bindValueToProperty ("usuarioSeleccionado.ultimaPublicacion.getFecha")]
		
		new Button(opcionesDeEdicion)=> 
		[
			caption = "Revisar Publicaciones"
			onClick([|this.revisarPublicaciones])
//			bindEnabled(getUsuarioSeleccionado)
//			
//			caption = "Revisar publicaciones"
//		    bindEnabledToProperty("usuarioSeleccionado")	
//			onClick [ | this.modelObject.abrirVentanaDeCalificaciones]
		]
		
		new Button(opcionesDeEdicion) => 
		[
			caption = "Blanquear clave"
			bindEnabledToProperty("usuarioSeleccionado")
			onClick [ | this.modelObject.blanquearContrasenha]
		]
		
		new Button(opcionesDeEdicion)=> 
		[
			caption = "Eliminar"
		    bindEnabledToProperty("usuarioSeleccionado")
			onClick [ | this.modelObject.eliminarUsuario]
		]
	}
	

	
	def panelConTablaDeResultado(Panel panelPrincipal) 
	{
		val tablaDeResultado = new Panel(panelPrincipal)
		
		new Table<Usuario>(tablaDeResultado, typeof(Usuario)) => 
		[
			//Bindeamos el contenido de la tabla
			items <=> "todosLosUsuarios.getUsuarios"
			value <=> "usuarioSeleccionado"
			//Definimos el alto y ancho de la tabla(opcional)
			width=400
			height=400
			
			// A continuacion armamos la tabla por fila, con su nombre y contenido
			
			new Column<Usuario>(it) => // it es la tabla resultante que armaremos
			[
				title = "Fecha de Registro" // Nombre de la 1ra columna
				fixedSize = 100 // ...su tamaño
				bindContentsToProperty("getFechaDeRegistro")
		 		//El nombre de la propiedad que se mostrará en esa celda del elemento perteneciente a esa fila.
			]
			
			new Column<Usuario>(it) => 
			[
				title = "Nombre"
				fixedSize = 100
				bindContentsToProperty("nombre")
			]
			
			new Column<Usuario>(it) => 
			[
				title = "Activo"
				fixedSize = 100 
				bindContentsToProperty("activo").transformer = [ getActivo | if (getActivo) "Si" else "No"]
			] 
			
			new Column<Usuario>(it) => 
			[
				title = "Baneado"
				fixedSize = 100 
				bindContentsToProperty("baneado").transformer = [ getBaneado | if (getBaneado) "Si" else "-"]
			] 
		]
		
		new Button(tablaDeResultado)=>
		[
			caption = "Nuevo"
			onClick[|this.modelObject.agregarUsuario (new Usuario())]
			//onClick[|this.modelObject.agregarUsuario (new Usuario(this.modelObject.usuarioLogeado))]
		]
	}
	
	def panelDeBusqueda(Panel panelPrincipal) 
	{
		val titulo = new Panel (panelPrincipal)
		titulo.layout = new HorizontalLayout
		
		new Label(titulo)=> [ text = "Usuarios" ]	
		
		val buscador = new Panel(panelPrincipal)
		buscador.layout = new ColumnLayout(3)
		
		new Label(buscador)=> [text = "Buscar por nombre de usuario"]	
		
		new TextBox(buscador)=> [
			//bindValueToProperty("")
		]
		new Button(buscador)=> [ caption = "Buscar"]	
	}
	
	
	
	def panelDeSituacionActual (Panel panelPrincipal) {
		val titulo = new Panel(panelPrincipal)
		val situacion = new Panel(panelPrincipal)
			
		new Label(titulo) => [ text = "Resumen de situación:" ]	
		// Tal vez deba volverla horizontal para que se arrincone en la izquierda
		//titulo.layout = new HorizontalLayout
		
		situacion.layout = new ColumnLayout(8)
		
		new Label(situacion)=> [ text = "Usuarios Registrados:" ]	
		
		new Label(situacion)=> 
		[ bindValueToProperty ("cantidadDeUsuariosRegistrados") 
		// Agregar el color del numero del resultado a BLUE
		]
		
		new Label(situacion)=> [ text = "Activos:" ]
		
		new Label(situacion)=> [ bindValueToProperty("cantidadDeUsuariosActivos")
			// Agregar el color del numero del resultado a BLUE
		]
		
		new Label(situacion)=> [ text = "Inactivos:" ]
		
		new Label(situacion)=> [ bindValueToProperty("cantidadDeUsuariosInactivos")
			// Agregar el color del numero del resultado a RED
		]
		
		new Label(situacion)=> [ text = "Baneados:" ]
		
		new Label(situacion)=> [ bindValueToProperty("cantidadDeUsuariosBaneados")
			// Agregar el color del numero del resultado a RED
		]
		
	}
	
	// ********************************************************
	//  Acciones
	// ********************************************************
	
	def revisarPublicaciones() 
	{
		new AdmCalificacionWindow(this, this.modelObject.administradorDeCalificaciones)
	}
	
	
	override protected addActions(Panel actionsPanel) 
	{
	}
	
//	override protected createFormPanel(Panel mainPanel) {
//	this.title="Rank-IT --> Adm Usuarios"
//		contenedorSituacion (mainPanel)
//		//contenedorBusqueda (mainPanel)
//		//contenedorTabla (mainPanel)
//		//contenedorOpciones (mainPanel)
//	}
	
	
	
}