rankitApp.service("CalificacionService", function () {

  this.calificacionesIds = 1;
  this.calificaciones = [

   {
    "id": 0,
    "puntos": 15,
    "fecha": null,
    "contenidoOfensivo": false,
    "detalle": "Detalle Calififcacion Lugar 1",
    "evaluado": {
      "id": 2,
      "nombre": "Abasto",
      "tipo": "LUGAR"
    },
    "usuario": {
      "fechaDeRegistro": 1476779011058,
      "nombre": "Maxi",
      "password": "Maxi",
      "activo": true,
      "baneado": false,
      "id": 1,
      "noTieneNombre": false
    },
    "datosSinDobleComilla": null
  }


  ];

  this.getPuntuableConElNombre=function(nombreEvaluado){
      return _.find(this.evaluados, function (puntuableBasico) {
      return evaluado.nombre == nombreEvaluado;
    });
  };

  this.crearCalificacion = function (nombreEvaluado,puntos,motivo) {
    var puntuable= this.getPuntuableConElNombre(nombreEvaluado);
    var calificacion = new Calificacion(puntuable,puntos,motivo);
    calificacion.id = this.calificacionesIds++;
    return calificacion;
  };

  this.agregarCalificacion = function (calificacion) {
    this.calificaciones.push(calificacion);
  };

  this.eliminarCalificacion=function(id){
      delete this.calificaciones[id];
  };

   this.getCalificacionById = function (id) {
      return _.find(this.calificaciones, function (calificacion) {
      return calificacion.id == id;
    });
  };

  this.modificarCalificacion=function(nombreEvaluado,puntos,motivo,id){
       var puntuable= this.getPuntuableConElNombre(nombreEvaluado);
       var calificacion=this.getCalificacionById(id);
       calificacion.evaluado=puntuable;
       calificacion.puntos=puntos;
       calificacion.motivo=motivo;


  };

  
  this.evaluados=[
   {
    "id": 1,
    "nombre": "Freddo",
    "tipo": "LUGAR"
  },
  {
    "id": 2,
    "nombre": "Abasto",
    "tipo": "LUGAR"
  },
  {
    "id": 1,
    "nombre": "Metrogas",
    "tipo": "SERVICIO"
  },
  {
    "id": 2,
    "nombre": "Edesur",
    "tipo": "SERVICIO"
  }
  ];
 

});

