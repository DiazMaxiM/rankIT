'use strict';

/* Controllers */

var rankitApp = angular.module('rankitApp', ['ui.router','ngResource']);

rankitApp.controller('LoginController', function ($resource) {
	 var self = this;
	 this.logeado = false
	 this.error =""
	 this.logear =function(){}

	 this.loginOk = function (data){
	 	self.logeado = true

	 }
	 this.errorLogin = function (data){
	 	self.logeado=false
	 	modalError("Error Login",data.error)
	 }
});
