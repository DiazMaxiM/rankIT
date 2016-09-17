package edu.unq.interfaces.rankit_Interfaz

import edu.unq.interfaces.rankit_dominio.Usuario
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.windows.ErrorsPanel
import edu.unq.interfaces.rankit_dominio.UsuarioAppModel
import java.text.SimpleDateFormat
import org.uqbar.arena.bindings.DateTransformer
import edu.unq.interfaces.rankit_dominio.CalificacionAppModel
import edu.unq.interfaces.component.LabelCheckBox
import org.uqbar.arena.widgets.TextBox
import java.awt.Color

class AdmUsuarioWindow extends SimpleWindow<UsuarioAppModel> 
{
	
	new(WindowOwner parent, UsuarioAppModel modelo)
	{
		super (parent, modelo)
		title = "Rank-IT -->Adm Usuarios"
	}
	
	override protected createFormPanel(Panel panelPrincipal) 
	{
		val panel = new Panel(panelPrincipal)
		panelDeSituacionActual(panel)
		panelDeBusqueda(panel)
		panelDeTablaYEdicion(panel)
	}
	
	def panelDeSituacionActual(Panel panelPrincipal) 
	{
	   val situacion = new Panel(panelPrincipal) 
	   situacion.layout = new VerticalLayout
	   new Label(situacion) => [ text = "Resumen de situación:" fontSize = 15]
       situacionActual (situacion)
	}
	
	def situacionActual (Panel panelDeSituacion)
	{
		val situacion = new Panel (panelDeSituacion)
		situacion.layout = new HorizontalLayout
		usuariosRegistrados(situacion)
		usuariosActivos(situacion)
		usuariosInactivos(situacion)
    	usuariosBaneados (situacion)
	}
	
	def usuariosRegistrados(Panel panelDeSituacion) 
	{
		new Label(panelDeSituacion)=>[ text="Usuarios Registrados: "]
	    new Label(panelDeSituacion)=> [ foreground = Color.BLUE bindValueToProperty("cantidadDeUsuariosRegistrados")]
	}
	
	def usuariosActivos(Panel panelDeSituacion) 
	{
		new Label(panelDeSituacion)=>[ text="   Activos: "]
	    new Label(panelDeSituacion)=> [ foreground = Color.BLUE bindValueToProperty("cantidadDeUsuariosActivos")]
	}
	
	def usuariosInactivos (Panel panelDeSituacion) 
	{
		new Label(panelDeSituacion)=>[ text="   Inactivos: "]
	    new Label(panelDeSituacion)=> [ foreground = Color.RED bindValueToProperty("cantidadDeUsuariosInactivos")]
	}	
	
	def usuariosBaneados (Panel panelDeSituacion) 
	{
		new Label(panelDeSituacion)=>[ text="   Baneados: "]
	    new Label(panelDeSituacion)=> [ foreground = Color.RED bindValueToProperty("cantidadDeUsuariosBaneados")]
	}
	
	def panelDeBusqueda (Panel panelPrincipal)
	{
		var busqueda= new Panel(panelPrincipal)
		busqueda.layout = new VerticalLayout
		new Label(busqueda)=> [ text = "Usuarios" fontSize = 15 ]
		buscador (busqueda)
	}
	
	def buscador (Panel panelDeBusqueda)
	{
		var busqueda= new Panel(panelDeBusqueda)
		busqueda.layout = new HorizontalLayout
		
		new Label(busqueda).text = "Buscar por nombre de usuario "
	    new TextBox(busqueda) => [ bindValueToProperty ("nombreABuscar") width = 180]
		
//		new TextBox(busqueda) => 
//		[
//			// tip: de esta manera se registra el binding
//			// anidado y se disparan notificaciones,
//			// si al searchFormPanel se le asigna como modelo
//			// el objeto example no se disparan 
//			value <=> "nombreABuscar"
//			width = 200
//		]
		
		new Button(busqueda) => 
		[
	      caption = "Buscar" width = 100
	      onClick ([|modelObject.buscarPorNombreDeUsuario]).setAsDefault.disableOnError
        ]		
	}

	def panelDeTablaYEdicion(Panel panelPrincipal) 
	{
		val tablaYEdicion= new Panel(panelPrincipal)
       tablaYEdicion.layout = new ColumnLayout(2)
   
        panelDeTablaDeResultado(tablaYEdicion)
        panelDeEdicionDeUsuario(tablaYEdicion)
	}

	def panelDeEdicionDeUsuario(Panel panelDeTablaYEdicion) 
	{
		val panelDeEdicion = new Panel(panelDeTablaYEdicion)
		panelDeEdicion.layout = new VerticalLayout
		nombreDeUsuarioAEditar(panelDeEdicion)
		panelDeErrores(panelDeEdicion)
		edicionDeFechaDeRegistro(panelDeEdicion)
		edicionDeCasillas(panelDeEdicion)
		ultimaPublicacionDelUsuario(panelDeEdicion)
		botones(panelDeEdicion)
	}

	def botones (Panel panel)
	{
		new Button(panel) => 
		[
			caption = "Revisar Publicaciones"
			onClick (
			[|new AdmCalificacionWindow 
				(this, new CalificacionAppModel(this.modelObject.administradorDeCalificaciones,
												this.modelObject.usuarioLogeado
												)
						.filtradoObligatorioPorUsuario (this.modelObject.usuarioSeleccionado)
				).open										
			])
		]
		
		new Button(panel) => 
		[
			caption = "Blanquear clave"
			bindEnabledToProperty("hayUsuarioSeleccionado")
			onClick [| this.modelObject.blanquearContrasenha]
			width = 150
	    ]
		
		new Button(panel) => 
		[
			caption = "Eliminar"
			bindEnabledToProperty("hayUsuarioSeleccionado")
			onClick [| this.modelObject.eliminarUsuario]
			width = 100
		]
	}

	def ultimaPublicacionDelUsuario (Panel panelDeEdicion) 
	{
		var panel = new Panel(panelDeEdicion)
		panel.layout = new HorizontalLayout
		new Label(panel).text = "Ultima publicacion:"
        new Label(panel) => 
        [
        	bindEnabledToProperty("hayUsuarioSeleccionado")
			bindValueToProperty("fechaDeLaUltimaPublicacion")
		]
	}

	def casillaBaneado (Panel panelDeEdicion) 
	{
		var usuarioBaneado = new Panel(panelDeEdicion)
		usuarioBaneado.layout = new HorizontalLayout
		new LabelCheckBox(usuarioBaneado).setText("Baneado").bindEnabledToProperty("hayUsuarioSeleccionado").bindValueToProperty("baneado")
	}

	def edicionDeCasillas (Panel panelDeEdicion) 
	{
		var casillas = new Panel(panelDeEdicion)
		casillas.layout = new VerticalLayout
		casillaActivo(casillas)
		casillaBaneado(casillas)
	}
	
	def casillaActivo (Panel panelDeEdicion) 
	{
		var usuarioActivo = new Panel(panelDeEdicion)
		usuarioActivo.layout = new HorizontalLayout
		new LabelCheckBox(usuarioActivo).setText("Activo").bindEnabledToProperty("hayUsuarioSeleccionado").bindValueToProperty("activo")
	}

	def edicionDeFechaDeRegistro (Panel panelDeEdicion)
	{
		new Label (panelDeEdicion).text = "Fecha de registro:"
		new TextBox (panelDeEdicion) => 
		[
			bindEnabledToProperty("hayUsuarioSeleccionado")
			bindValueToProperty("fechaDeRegistroDelUsuario").transformer = new DateTransformer
		]
	}

	def panelDeErrores (Panel panelDeEdicion) 
	{
	    new ErrorsPanel(panelDeEdicion, "Edita la información")
	}

	def nombreDeUsuarioAEditar(Panel panelDeEdicion)
	{
		var nombreDeUsuario = new Panel(panelDeEdicion)
		nombreDeUsuario.layout = new  ColumnLayout(2)
		new Label(nombreDeUsuario)=> [text="Nombre:" fontSize = 15]
//		new Label(nombreDeUsuario)=> [value <=> "nombre" fontSize = 15]
//		new Label(nombreDeUsuario).text = "Nombre:"
		new TextBox(nombreDeUsuario) => 
		[
			bindEnabledToProperty("hayUsuarioSeleccionado")
			bindValueToProperty("nombre")
		]
	}
	
	def panelDeTablaDeResultado(Panel panelPrincipal) 
	{
		val panelDeResultado = new Panel(panelPrincipal)
	  	tablaDeResultado(panelDeResultado)
	  	panelDeResultado.layout = new VerticalLayout
	  	new Button(panelDeResultado) => [ caption = "Nuevo" onClick [| this.modelObject.agregarNuevoUsuario] ] 
	}

	def tablaDeResultado(Panel panelPrincipal) 
	{
		val tabla = new Panel(panelPrincipal)
		tabla.layout = new VerticalLayout
		new Table<Usuario> (tabla, typeof (Usuario)) => 
		[
			//bindeamos el contenido de la tabla
			(items <=> "usuarios")
			value <=> "usuarioSeleccionado"
			//le definimos el alto y ancho, esto es opcional
			width= 300
			height= 500
			// describimos cada fila
			// para esto definimos las celdas de cada filar
			// it es la grilla de resultados 
			 
			new Column<Usuario>(it) => 
			[
				title = "Fecha De Registro" //el nombre de la columna
				fixedSize = 150   //el tamaño que va a tener
				bindContentsToProperty("fechaDeRegistro").transformer = [fechaDeRegistro | new SimpleDateFormat("dd/MM/YYYY HH:mm").format(fechaDeRegistro)]
		 		//la propiedad que mostramos del objeto que está atrás de la fila 
			] 
			
			new Column<Usuario>(it) => 
			[
				title = "Nombre" //el nombre de la columna
				fixedSize = 100   //el tamaño que va a tener
				bindContentsToProperty("nombre")
			] 
			
			new Column<Usuario>(it) => 
			[
				title = "Activo"
				fixedSize = 100 
				bindContentsToProperty("activo").transformer = [ esActivo | if (esActivo) "Sí" else "No"]
			] 
			
			new Column<Usuario>(it) => 
			[
				title = "Baneado"
				fixedSize = 100 
				bindContentsToProperty("baneado").transformer = [ estaBaneado | if (estaBaneado) "Sí" else "-"]
			]
		]  
    }
	
	override protected addActions(Panel actionsPanel) 
	{
		//throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}
//			caption = "Revisar Publicaciones"
//			onClick([|
//				new AdmCalificacionWindow(
//					this,
//					new CalificacionAppModel(
//											this.modelObject.administradorDeCalificaciones,
//											this.modelObject.admDePuntuables,
//											this.modelObject.usuarioLogeado).
//											 filtradoObligatorioPorUsuario(this.modelObject.usuarioSeleccionado)).open
//												
//				
//				
//			])

