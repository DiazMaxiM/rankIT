rankitApp.controller('LoginController', function ($resource) 
{
	var app = angular.module('RegistroController', []);
	
	app.controller('RegistroCtrl', function ($scope) 
	{	
	    $scope.usuariosRegistrados =[{nombre:"Camila", contrasenha:"1234"}, {nombre:"Liza", contrasenha:"5678"}];
		$scope.nombre ="";
		$scope.cantUsuarios = function() 
		{
			return $scope.usuariosRegistrados.length;
		}
		
		scope.loguearseSiPuede = function() 
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
			
	 //var self = this;
	 //this.logeado = false
	 //this.error =""
	 //this.logear =function(){}

	 //this.loginOk = function (data){
	 //	self.logeado = true}
	 
	 //this.errorLogin = function (data){
	 //	self.logeado=false
	 //	modalError("Error Login",data.error)}
		
	}
);

