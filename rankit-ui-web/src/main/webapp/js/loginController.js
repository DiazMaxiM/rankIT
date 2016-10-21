rankitApp.controller('LoginController', function ($resource) 
{
	var app = angular.module('RegistroController', []);
	usuarios = LoginService.usuarios;
	
	app.controller('RegistroCtrl', function ($scope) 
	{	
		$scope.nombre ="";
		$scope.contrasenha ="";
		$scope.usuarioLogueado;
		
		$scope.loguear = function () 
		{
			var usuarioLogueado= loginService.login($http,$scope.nombre,$scope.contrasenha,$scope.loguearUsuario(),$scope.errorDeLogueo());
		}
		
		$scope.loguearUsuario = function () 
		{
			$state.go('logeado');
		}
		
		$scope.errorDeLogueo = function () 
		{
			//muestra en pantalla los errores
		}
			
	 //var self = this;
	 //this.logeado = false
	 //this.error =""
	 //this.logear =function(){}

	 //this.loginOk = function (data){
	 //	self.logeado = true}
	 
	 //this.errorLogin = function (data){
	 //	self.logeado=false
	 //	modalError("Error Login",data.error)}
		
	})
});

