'use strict';

/* Controllers */
var rankitApp = angular.module('rankitApp', ['ui.bootstrap']);
 

rankitApp.controller('CalificacionController', function ($http,$scope,CalificacionService) {
  var self=this;
  this.nombreEvaluado = null;
  this.puntos = null;
  this.detalle = null;
  this.id=null;

  this.calificaciones = CalificacionService.calificaciones;

  this.modificacionOk = function (data){
       console.log("La  modificacion fue exitosa")
  }
  this.error = function (data){
       console.log("NO VA AL SERVIDOR")
  }


  this.calificar = function () {

        if(self.id==null){

           var calificacion = CalificacionService.crearCalificacion(this.nombreEvaluado,this.puntos,this.detalle);
           CalificacionService.agregarCalificacion(calificacion);

       }else{
          CalificacionService.modificarCalificacion($http,this.nombreEvaluado,this.puntos,this.detalle,this.id,this.modificacionOk,this.error);
         
      }
        self.nombreEvaluado = null;
        self.puntos = null;
        self.detalle = null;
        self.id=null; 
        $scope.formu.puntos.$dirty=false;
        $scope.formu.motivo.$dirty=false;
        $scope.formu.calificado.$dirty=false;

    };

  this.evaluados=CalificacionService.evaluados;

   this.eliminarOk = function (data){
       console.log("Se elimino la calificacion")
  }
  this.errorEliminar = function (data){
       console.log("No eimina")
  }


  this.eliminar=function(calificacion){
       CalificacionService.eliminarCalificacion($http,calificacion.id,this.eliminarOk,this.errorEliminar);
       var elemento=document.getElementById(calificacion.id); 
       elemento.parentElement.removeChild(elemento);
  };





  this.modificar=function(calificacion){
     self.nombreEvaluado=calificacion.evaluado.nombre;
     self.puntos=calificacion.puntos;
     self.detalle=calificacion.detalle;
     self.id=calificacion.id;

  };


 
  
});
