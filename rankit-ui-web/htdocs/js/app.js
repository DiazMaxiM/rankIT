'use strict';

/* Controllers */
var rankitApp = angular.module('rankitApp', ['ui.router']);

rankitApp.controller('AgregarTareaController', function (TareasService) {

  this.descripcionTarea = '';
  this.tareas = TareasService.tareas;

  this.agregarTarea = function () {
    var tarea = TareasService.crearTarea(this.descripcionTarea);
    TareasService.agregarTarea(tarea);
    this.descripcionTarea = '';
  };

});

rankitApp.controller('LoginController', function ($http) {

  this.logear = function () {
    var data = {}
    data.nombre= this.usuario
    data.password = this.password
   //$http.get('http://localhost:9000', config).then(successCallback, errorCallback);
    var estado =$http({
            url: 'http://localhost:9000/usuarios',
            method: "POST",
            data: data,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
}).success().error();



};

});



rankitApp.controller('EditarTareaController', function ($stateParams, $state, TareasService) {

  this.tarea = TareasService.getTareaById($stateParams.id);

  if (!this.tarea) {
    $state.go("agregarTarea");
    return;
  }

  this.descripcionTarea = this.tarea.descripcion;

  this.aceptar = function () {
    this.tarea.descripcion = this.descripcionTarea;
    $state.go("agregarTarea");
  };

});

  
  
