rankitApp.controller('LoginController', function ($scope,$resource,LoginService,$state, DataService) 
{      
       var self=this;
	   this.usuarioLogueado= new Object;
       this.idUsuario=null;
	   
	   this.loguearUsuario = function () 
		{   
			LoginService.guardar(this.usuarioLogueado, function(data) {
			   self.loguear(data.id);
			   console.log(DataService)
			   $state.go('logeado');
	        }, errorHandler);
		};
		
		this.loguear = function (id)
		{
			DataService.usuario.id = id;
			DataService.usuario.nombre = self.usuarioLogueado.nombre;
		}
		
		function errorHandler(error)
		{
			console.log(error.data);
			switch (error.status)
			{
				case 404: 
				//this.usuarioNoRegistrado();
				console.log("usuario no registrado");
				break;
				case 401: 
				//this.contrasenhaIncorrecta();
				console.log("contrasenha incorrecta"); //No entra aqui
				break;
			}
		}
});
  