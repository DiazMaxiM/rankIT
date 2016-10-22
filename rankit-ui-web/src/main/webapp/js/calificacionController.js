rankitApp.controller('CalificacionController', function ($resource,Evaluados,Calificacion,$state) {
  var self=this;
  
  this.usuarioLogueado="Liza";
  console.log(self.usuarioLogueado)
  
  self.calificaciones = [];
 
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
      Calificacion.query(self.usuarioLogueado,function(data) {
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
	        Calificacion.save(this.nuevaCalificacion, function(data) {
	            self.actualizarCalificaciones();
	            self.nuevaCalificacion = null;
	        }, errorHandler);
	    };
	    
	//actualizarCalificacion
  
    this.actualizarLibro = function() {
	        Calificacion.update(this.calificacionSeleccionada, function() {
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
   this.modificar=function(calificacion){
	   self.calificacionSeleccionada=calificacion; 
   }
    
  
});