rankitApp.service("CalificacionService", function () {

  this.calificacionesIds = 0;
  this.calificaciones = [];

  this.crearCalificacion = function (nombre,puntos,motivo) {
    var calificacion = new Calificacion(nombre,puntos,motivo);
    calificacion.id = this.calificacionesIds++;
    return calificacion;
  };

  this.agregarCalificacion = function (calificacion) {
    this.calificaciones.push(calificacion);
  };
  
  this.evaluados=[
      "Freddo",
      "Metrogas",
      "Edesur", 
  ];
 

});

