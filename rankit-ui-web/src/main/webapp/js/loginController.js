rankitApp.controller('LoginController', function ($http,$scope,$state,loginService) 
{
	    $scope.nombre ="";
		$scope.contrasenha ="";
		$scope.usuarioLogueado= null;
		
		$scope.loguear = function () 
		{
			$scope.usuarioLogueado= loginService.login($http,$scope.nombre,$scope.contrasenha,$scope.loguearUsuario(),$scope.errorDeLogueo());
		}
		
		$scope.loguearUsuario = function () 
		{
			//$state.go('logeado');
		}
		
		$scope.pepe = function () 
		{
			return $scope.usuarioLogueado;
		}
		
		$scope.errorDeLogueo = function () 
		{
			//muestra en pantalla los errores
		}
	
});
  