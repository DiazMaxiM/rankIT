rankitApp.controller('CalificacionController', function ($resource,Evaluados,Calificacion,$state,DataService) {
  
  var self=this;
  this.idUsuarioLogueado=DataService.usuario.id;
  console.log(self.idUsuarioLogueado);
  this.calificaciones = [];
  this.evaluados=[];
  
  console.log(this.evaluados);
  
  this.evaluadosParaCalificar = function() {
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
   this.evaluadosParaCalificar();
   
// eliminar calificacion
   this.eliminar = function(calificacion) {
     
	    	    Calificacion.remove(calificacion, function() {
                self.actualizarCalificaciones();
             }, errorHandler);
 };


});