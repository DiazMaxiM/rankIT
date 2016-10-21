<<<<<<< HEAD
rankitApp.controller('LoginController', function ($scope,$resource,Logueo,$state) 
{        
	   this.usuario= new Object;

	   this.usuario
	   function errorHandler(error) {
		    console.log(error.data);
		}
		
		this.loguearUsuario = function () 
		{   
			Logueo.save(this.usuario, function(data) {
	      
	        }, errorHandler);
			
		};
=======
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
<<<<<<< HEAD
			//$state.go('logeado');
		}
		
		$scope.pepe = function () 
		{
			return $scope.usuarioLogueado;
		}
=======
			$state.go('logeado');
		
>>>>>>> bfeab6498ba5ffbe2be1a53d6d9ce08ac465c03f
>>>>>>> 7ca2d73a3e98d893f1540d3718e8c7234c80f7f3
		
//		$scope.loguearUsuario = function () 
//		{
//			$state.go('logeado');
//		};
//		
//		$scope.errorDeLogueo = function () 
//		{
//			//muestra en pantalla los errores
//		};
//	
});
  