'use strict';

var rankitApp = angular.module('rankitApp', ['ui.router','ngResource']);


 


rankitApp.service("UsuarioServicio", function(){

this.usuario = "Maxi";
self = this
return {
        get: function(){
            return self.usuario;
        },
        set: function(usuarioNuevo){
            return self.usuario=usuarioNuevo;
        }
    };
});