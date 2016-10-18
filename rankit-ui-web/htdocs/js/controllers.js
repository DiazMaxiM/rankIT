'use strict';

/* Controllers */
var rankitApp = angular.module('rankitApp', ['ui.bootstrap']);
 

rankitApp.controller('CalificacionController', function ($scope,CalificacionService) {
  var self=this;
  this.nombreEvaluado = null;
  this.puntos = null;
  this.detalle = null;
  this.id=null;

  this.calificaciones = CalificacionService.calificaciones;

  this.calificar = function () { 
  	if(self.id==null){

       var calificacion = CalificacionService.crearCalificacion(this.nombreEvaluado,this.puntos,this.detalle);
       CalificacionService.agregarCalificacion(calificacion);

    }else{
        CalificacionService.modificarCalificacion(this.nombreEvaluado,this.puntos,this.detalle,this.id);

    }
    self.nombreEvaluado = null;
    self.puntos = null;
    self.detalle = null;
    self.id=null; 
  };

  this.evaluados=CalificacionService.evaluados;

  this.eliminar=function(calificacion){
       CalificacionService.eliminarCalificacion(calificacion.id);
       var elemento=document.getElementById(calificacion.id); 
       elemento.parentElement.removeChild(elemento);
  }

  this.modificar=function(calificacion){
     self.nombreEvaluado=calificacion.evaluado.nombre;
     self.puntos=calificacion.puntos;
     self.detalle=calificacion.detalle;
     self.id=calificacion.id;

  }

});
