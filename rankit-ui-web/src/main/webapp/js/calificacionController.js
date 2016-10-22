rankitApp.controller('CalificacionController', function ($resource,Evaluados,Calificacion,$state,DataService) {
  
  var self=this;
  this.idUsuarioLogueado=DataService.usuario.id;
  console.log(self.idUsuarioLogueado);
  this.calificaciones = [];
  self.evaluados=[];
  console.log(this.calificaciones);
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

});