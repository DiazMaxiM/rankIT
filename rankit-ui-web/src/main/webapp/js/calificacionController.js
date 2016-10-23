rankitApp.controller('CalificacionController', function ($resource,Evaluados,Calificacion,$state,DataService,ActualizarCalificacion) {
  
  var self=this;
  this.nombreEvaluado=null,
  this.calificaciones = [];
  this.evaluados=[];
  
 
  
  this.evaluadosParaCalificar = function() {
     Evaluados.query(function(data) {
        self.evaluados = data;
     }, errorHandler);
 };
  

  function errorHandler(error) {
      console.log(error.data);
  }
  
   this.actualizarCalificaciones = function() {
	   console.log(DataService);
      Calificacion.query(DataService.usuario,function(data) {
          self.calificaciones = data;
      }, errorHandler);
   };
  
   this.actualizarCalificaciones();
   this.evaluadosParaCalificar();
   
// eliminar calificacion
   this.eliminar = function(calificacion) {
     
	    	    Calificacion.remove(calificacion, function() {
                self.actualizarCalificaciones();
             }, errorHandler);
 };
 
 this.evaluadoByNombre=function(nombre){
	 return _.find(this.evaluados, function (Object) {
	      return Object.nombre == nombre;
	    })
 };
 
 
 //agregar calificacion
   this.calificar=function(){
	   
	   if(self.nuevaCalificacion.id==null){
		   
		   self.agregarCalificacion();
	   }else{
		    self.actualizarCalificacion();
	   }
	   self.nombreEvaluado=null;
	   self.nuevaCalificacion=null;
   };
   
   this.agregarCalificacion=function(){
	   var evaluado=self.evaluadoByNombre(self.nombreEvaluado);
       self.nuevaCalificacion.evaluado=evaluado;
	   self.nuevaCalificacion.usuario=DataService.usuario.id;
       ActualizarCalificacion.save(this.nuevaCalificacion,function(data) {
		   self.actualizarCalificaciones();
	    },errorHandler);

	  
      };
		     
	  this.actualizarCalificacion=function(){
		   var evaluado=self.evaluadoByNombre(self.nombreEvaluado);
	       self.nuevaCalificacion.evaluado=evaluado;
	       ActualizarCalificacion.update(this.nuevaCalificacion,function(data) {
				 self.actualizarCalificaciones();
			    },errorHandler);  
	  };
	    
  //modificar calificacion 
	    this.modificar=function(calificacion){
	    	self.nombreEvaluado=calificacion.evaluado.nombre;
	    	self.nuevaCalificacion=calificacion;
	}
   
});