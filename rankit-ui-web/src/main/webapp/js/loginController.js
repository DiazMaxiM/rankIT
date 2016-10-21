rankitApp.controller('LoginController', function ($http,$scope,$state) 
{
	$scope.nombre ="";
		$scope.contrasenha ="";
		$scope.usuarioLogueado;
		
		$scope.loguear = function () 
		{
			//var usuarioLogueado= loginService.login($http,$scope.nombre,$scope.contrasenha,$scope.loguearUsuario(),$scope.errorDeLogueo());
		}
		
		$scope.loguearUsuario = function () 
		{
			$state.go('logeado');
		}
		
		$scope.errorDeLogueo = function () 
		{
			//muestra en pantalla los errores
		}
	
});
  