rankitApp.controller('LoginController', function ($scope,$resource,LoginService,$state, DataService) 
{      
       var self=this;
	   this.usuarioLogueado= new Object;
       this.idUsuario=null;
	   
	   function errorHandler(error) {
		    console.log(error.data);
		}
		
		this.loguearUsuario = function () 
		{   
			LoginService.guardar(this.LoginService, function(data) {
			   console.log(data);
			   self.loguear();
			   $state.go('logeado');
	        }, errorHandler);
			
		};
		
		this.loguear = function ()
		{
			DataService.usuario.nombre = self.usuarioLogueado.nombre;
		}
		
//		$scope.loguearUsuario = function () 
//		{
//			$state.go('logeado');
//		};

//		$scope.errorDeLogueo = function () 
//		{
//			//muestra en pantalla los errores
//		};
});
  