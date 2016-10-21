
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
  