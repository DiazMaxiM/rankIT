rankitApp.controller('CalificacionController', function ($resource,$timeout,Evaluados,Calificacion,$state,DataService,ActualizarCalificacion) {
  
  var self=this;
  this.nombreEvaluado='',
  this.puntos=0;
  this.detalle=null;
  this.nuevaCalificacion=new Object;
  this.calificaciones= [];
  this.evaluados=[];
  
 
  
  this.evaluadosParaCalificar = function() {
     Evaluados.query(function(data) {
        self.evaluados = data;
     }, errorHandler);
 };
  
 
 function errorHandler(error) {
     self.notificarError(error.data);
 };

 
 
	function errorAlAgregar(error){
		
		switch (error.status){
			case 400: 
			self.notificarError("La calificación se encuenta incompleta");
			break;
			case 404:
			self.notificarError("No se encuentra la calificación a modificar");
			self.nuevaCalificacion=new Object;
			break;
		   default:
		}
	};
	
	function errorAlEliminar(error){
		
		switch (error.status){
		case 400: 
		self.notificarError("No se informó la calificación a eliminar");
		break;
		case 404:
		self.notificarError("No existe la calificación a eliminar");
		break;
	    default:
	}
		
		
		
	};
  
   this.actualizarCalificaciones = function() {
      Calificacion.query(DataService.usuario,function(data) {
          self.calificaciones = data;
      }, errorHandler);
   };
  
   this.actualizarCalificaciones();
   this.evaluadosParaCalificar();
   
// eliminar calificacion
   this.eliminar = function(calificacion) {
	   var mensaje = "¿Está seguro que quiere eliminar la calificación?";
	   bootbox.confirm(mensaje, function(confirma) {
	         if (confirma) {
	        	 Calificacion.remove(calificacion, function() {
	                 self.actualizarCalificaciones();
	              }, errorAlEliminar);
	         }
	   });
 };

 
 this.evaluadoByNombre=function(nombreBuscado){
	  var evaluado=null;
	  for (i = 0, len = self.evaluados.length; i < len; i++) { 
		     if (self.evaluados[i].nombre==nombreBuscado){
		    	 evaluado=self.evaluados[i];
		     }
	   }
	  return evaluado;
	 
 };
 
 
 //agregar calificacion
   this.calificar=function(){
	   
	   if(self.detalle==null){
		   self.detalle="";
	   }
	   var evaluado=self.evaluadoByNombre(self.nombreEvaluado);
	   self.nuevaCalificacion.evaluado=evaluado;
	   self.nuevaCalificacion.puntos=self.puntos;
	   self.nuevaCalificacion.detalle=self.detalle;
	   if(self.nuevaCalificacion.id==null){
		   
		   self.agregarCalificacion();
	   }else{
		    self.actualizarCalificacion();
	   }
     };
   
   
   
   this.agregarCalificacion=function(){	   
	   self.nuevaCalificacion.usuario=DataService.usuario.id;
       ActualizarCalificacion.save(this.nuevaCalificacion,function(data) {
    	   self.notificarMensaje('La calificación fue agregada');
		   self.actualizarCalificaciones();
		   self.nombreEvaluado='';
		   self.puntos=0;
		   self.detalle='';
		   self.nuevaCalificacion=new Object;
		   
	    },errorAlAgregar);
	  
      };
		     
	  this.actualizarCalificacion=function(){
	       ActualizarCalificacion.update(this.nuevaCalificacion,function(data) {
	    	    self.notificarMensaje('La calificación fue actualizada');
				 self.actualizarCalificaciones();
				 self.actualizarCalificaciones();
				 self.nombreEvaluado='';
				 self.puntos=0;
				 self.detalle='';
				 self.nuevaCalificacion=new Object;
			    },errorAlAgregar);  
	  };
	    
  //modificar calificacion 
	    this.modificar=function(calificacion){
	    	 self.nombreEvaluado=calificacion.evaluado.nombre;
	   	     self.puntos=calificacion.puntos;
		     self.detalle=calificacion.detalle;
	    	 self.nuevaCalificacion=calificacion;
	}
	    
	   //resultados y errores al  calificar
	    this.msgs = [];
	    console.log(self.msgs);
	    this.notificarMensaje = function(mensaje) {
	        this.msgs.push(mensaje);
	        this.notificar(this.msgs);
	    };

	    this.errors = [];
	    this.notificarError = function(mensaje) {
	        this.errors.push(mensaje);
	        this.notificar(this.errors);
	    };

	    this.notificar = function(mensajes) {
	        $timeout(function() {
	            while (mensajes.length > 0) mensajes.pop();
	        }, 3000);
	    }

   
});