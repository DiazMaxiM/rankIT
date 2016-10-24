rankitApp.controller('LoginController', function ($scope,$resource,LoginService,$state, DataService) 
{      
       var self=this;
	   this.usuarioLogueado= new Object;
       this.idUsuario=null;
	   
	   this.loguearUsuario = function () 
		{   
			LoginService.login(this.usuarioLogueado, function(data) {
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
					this.errorUsuarioNoRegistrado();
					break;
				case 400: 
					this.errorContrasenhaIncorrecta();
					console.log("contrasenha incorrecta");
					break;
				case 401:
					this.esNombreValido = true;
					console.log("Nombre de usuario inválido");
					break;
			}
		}
		
		this.errorUsuarioNoRegistrado = function ()
		{
			// Falta mostrar error de usuario no registrado
			console.log("usuario no registrado");
		}
		
		this.errorContrasenhaIncorrecta = function ()
		{
			// Falta mostrar error de contraseña incorrecta
			console.log("usuario no registrado");
		}
		
		this.nombre ="";
		this.contrasenha="";
		this.esNombreValido=false;
		this.registroSinContrasenha=false;
		
		this.registrar = function ()
		{
			LoginService.guardar()
			DataService.usuario.id = id;
			DataService.usuario.nombre = self.usuarioLogueado.nombre;
		}
		
		
		
});
  