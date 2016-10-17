'use strict';

/* Controllers */
var rankitApp = angular.module('rankitApp', ['ngTouch','ui.bootstrap']);
 

rankitApp.controller('CalificacionController', function ($scope,CalificacionService) {

  this.nombre = '';
  this.puntos = '';
  this.motivo = '';

  this.calificaciones = CalificacionService.calificaciones;

  this.calificar = function () {
    var calificacion = CalificacionService.crearCalificacion(this.nombre,this.puntos,this.motivo);
    CalificacionService.agregarCalificacion(calificacion);
    this.nombre = '';
    this.puntos = '';
    this.motivo = '';
  };

  this.evaluados=CalificacionService.evaluados;

});
