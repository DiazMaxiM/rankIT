rankitApp.controller('CalificacionController', function ($resource,Evaluados,Calificacion,$state,DataService) {
  
  var self=this;
  this.idUsuarioLogueado=DataService.usuario.id;
  console.log(self.idUsuarioLogueado);
  self.calificaciones = [{"evaluado":{"id":2,"nombre":"Abasto","tipo":"LUGAR"},"promedio":15,"puntos":15,"detalle":"Detalle Calififcacion Lugar 1","id":1},{"evaluado":{"id":1,"nombre":"Metrogas","tipo":"SERVICIO"},"promedio":10,"puntos":15,"detalle":"Detalle Calififcacion Servicio 1","id":2}];
  self.evaluados=[];
  
  this.evaluados = function() {
      Evaluados.query(function(data) {
          self.evaluados = data;
      }, errorHandler);
  };
  

  function errorHandler(error) {
      console.log("todo mal");
  }
  
   this.actualizarCalificaciones = function() {
	   console.log(DataService);
      Calificacion.query(DataService.usuario,function(data) {
          self.calificaciones = data;
      }, errorHandler);
   };
  
   this.actualizarCalificaciones();
  
  // Calificar
  this.calificar = function(calificacion) {
	  if(calificacion.id==null){
		     self.crearCalificacion();
		  }else{
			  self.actualizarCalificacion();
		  }
	  
	  };
	  
   // crear Calificacion
	    this.crearCalificacion = function() {
	        Calificacion.save(this.calificacion, function(data) {
	            self.actualizarCalificaciones();
	            self.calificacion = null;
	        }, errorHandler);
	    };
	    
	//actualizarCalificacion
  
    this.actualizarLibro = function() {
	        Calificacion.update(this.calificacionSeleccionado, function() {
	            self.actualizarCalificaciones();
	        }, errorHandler);

	        this.calificacionSeleccionada = null;

	     };
	   
    // eliminar calificacion
     this.eliminar = function(calificacion) {
       
	    	     Calificacion.remove(calificacion.id, function() {
                  self.actualizarCalificaciones();
               }, errorHandler);
     }
 
   //mostrar calificacion
   this.modificar=function(calificacionActualizada){
	   self.calificacion.evaluado=calificacionActualizada.evaluado;
	   self.calificacion.puntos=calificacionActualizada.puntos;
	   self.calificacion.detalle=calificacionActualizada.detalle;
	   self.calificacionSeleccionada=calificacionActualizada; 
   }
    
  
});