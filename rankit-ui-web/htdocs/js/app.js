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
    console.log(data)
  }
  this.errorLogin = function (data){
    self.logeado=false
    modalError("Error Login",data.error)
  }
});