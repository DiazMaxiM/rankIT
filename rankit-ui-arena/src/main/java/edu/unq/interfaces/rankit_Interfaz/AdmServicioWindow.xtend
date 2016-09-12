package edu.unq.interfaces.rankit_Interfaz

import org.uqbar.arena.windows.WindowOwner
import edu.unq.interfaces.rankit_dominio.PuntuableAppModel
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.tables.Table
import edu.unq.interfaces.rankit_dominio.Puntuable
import org.uqbar.arena.widgets.tables.Column
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import java.text.SimpleDateFormat
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.CheckBox

class AdmServicioWindow extends AdmLugarWindow{
	
	new(WindowOwner parent, PuntuableAppModel model) {
		super(parent, model)
	}
	
	override puntuablesInscriptos(Panel panel){
		new Label(panel)=>[
	   	    text="Servicios Inscriptos: "
		]
	    new Label(panel)=> [
			bindValueToProperty("administradorDePuntuables.serviciosInscriptos")
		]
	}
	
	override puntuablesHabilitados(Panel panel) {
		new Label(panel)=>[
	   	    text="Habilitados: "
			
		]
		new Label(panel)=> [
			bindValueToProperty("administradorDePuntuables.serviciosHabilitados")
		]
	}
	
	override puntuablesDesHabilitados(Panel panel) {
		new Label(panel)=>[
	   	    text="Deshabilitados: "
		]
		
		new Label(panel)=> [
			bindValueToProperty("administradorDePuntuables.serviciosDeshabilitados")
		]
	}
	
	override ingresarDatos(Panel panel){
		new Label(panel).text = "Buscar por nombre de servicio"
	    new TextBox(panel) => [
	       bindValueToProperty("nombreDelServicioBuscado")
	       
           width = 200 
         ]  
	}
	
	override buscar(Panel panel){
		 new Button(panel) => [
	      caption = "Buscar"
	      onClick([|modelObject.buscarPorNombreDeServicio])
	      .setAsDefault
          .disableOnError
         ]
	}
	
	  override cambiarNombreYHabilitar(Panel panel) {
		new Label(panel).text = "Nombre:"
		new TextBox(panel)=> [
			bindEnabledToProperty("hayPuntuableSeleccionado")
		    bindValueToProperty("nombreServicio")
		]
		new Label(panel).text= "Habilitado"
		new CheckBox(panel)=> [
			bindEnabledToProperty("hayPuntuableSeleccionado")
		    bindValueToProperty("habilitadoServicio")
		]
	}
	
	
		override revisarYEliminar(Panel panel){
		     new Button(panel) => [
		      caption = "Revisar Publicaciones"
		      bindEnabledToProperty("hayPuntuableSeleccionado")
		       onClick[|this.mostrarPuntuableSeleccionado]
	         ]
	         new Button(panel) => [
		      caption = "Eliminar"
		      bindEnabledToProperty("hayPuntuableSeleccionado")
		      onClick [| 
			 	this.modelObject.eliminarServicio
			 ]
		      
	         ]
	}
	
	
		override contenedorTabla(Panel panel) {
	
		val panelTabla=new Panel(panel)
		new Table<Puntuable>(panelTabla, typeof(Puntuable)) => [
			//bindeamos el contenido de la tabla
			(items <=> "administradorDePuntuables.servicios")
			value <=> "puntuableSeleccionado"
			//le definimos el alto y ancho, esto es opcional
			width=200
			// describimos cada fila
			// para esto definimos las celdas de cada filar
			// it es la grilla de resultados 
			 
			new Column<Puntuable>(it) => [
				title = "Fecha De Registro" //el nombre de la columna
				fixedSize = 150   //el tamaño que va a tener
				bindContentsToProperty("fechaDeRegistro").transformer = [fecha | new SimpleDateFormat("dd/MM/YYYY HH:mm").format(fecha)]
		 //la propiedad que mostramos del objeto que está atrás de la fila 
			] 
			
			new Column<Puntuable>(it) => [
				title = "Nombre" //el nombre de la columna
				fixedSize = 150   //el tamaño que va a tener
				bindContentsToProperty("nombre")
		 //la propiedad que mostramos del objeto que está atrás de la fila 
			] 
			
			new Column<Puntuable>(it) => [
				title = "Habilitado" //el nombre de la columna
				fixedSize = 150   //el tamaño que va a tener
				bindContentsToProperty("habilitado").transformer = [ Boolean isHabilitado | if (isHabilitado) "SI" else "NO" ]
		 //la propiedad que mostramos del objeto que está atrás de la fila 
			] 
			]  
    }
	
	override panelBotones(Panel panel) {
		val panelBotones=new Panel(panel)
		new Button(panelBotones) =>[
			caption = "Nuevo"
			onClick [| 
				this.modelObject.nuevoServicio
			]
		] 
	}
	
}