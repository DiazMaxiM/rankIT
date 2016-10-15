'use strict';

/* Controllers */
var rankitApp = angular.module('rankitApp', ['ui.router']);

function modalError(title,error){
 $('#containerModal').html(error)
 $('#modal-title').html(title)
 $("#myModal").modal() 
}

rankitApp.controller('LoginController', function ($http,LoginService) {
  var self = this;
  this.logeado = false
  this.error =""
  this.logear =function(){LoginService.login($http,this.nombre,this.password,this.loginOk,this.errorLogin)}

  this.loginOk = function (data){
    self.logeado = true

  }
  this.errorLogin = function (data){
    self.logeado=false
    modalError("Error Login",data.error)
  }
});
rankitApp.controller('BusquedaCalificacionController', function ($http,CalificacionService) {
 self=this
 this.result=[]

 this.nombre=""
 this.calificaciones=""
 this.ranking=""

 this.dataTipo = {
  model: '',
  availableOptions: [
  {id: ''        , name: 'Todos'},
  {id: 'SERVICIO', name: 'Servicio'},
  {id: 'LUGAR'   , name: 'Lugar'}
  ]
};

this.buscar= function(){CalificacionService.buscar($http,this.nombre,this.dataTipo.model,this.calificaciones,this.ranking,this.busquedaOk,this.errorBusqueda)}

this.busquedaOk = function (data){
  self.result= data
}
this.errorBusqueda = function (data){
  console.log(data)
}


});