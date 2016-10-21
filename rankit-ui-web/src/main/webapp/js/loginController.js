rankitApp.controller('LoginController', function ($resource) 
{
	var app = angular.module('RegistroController', []);
	
	app.controller('RegistroCtrl', function ($scope) 
	{	
		$scope.nombre ="";
		$scope.contrasenha ="";
		
		$scope.loguearseSiPuede = function() 
		{
			if (puedoLoguearme())
			{
				loguear()
			}
			else
			{
				noHayRegistroValido()
			}
		}
		
		$scope.loguear = function () 
		{
			//redirecciona a otra pagina (cambia de estado)
		}
		
		$scope.noHayRegistroValido = function () 
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

