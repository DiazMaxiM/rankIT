rankitApp.controller('LoginController', function ($scope,$resource,LoginService,$state, DataService) 
{      
       var self=this;
	   this.usuarioLogueado= new Object;
	   this.usuarioARegistrar= new Object;
       this.idUsuario=null;
	   
	   this.loguearUsuario = function () 
		{   
			LoginService.login(this.usuarioLogueado, function(data) {
			   self.loguear(data.id);
			   console.log(DataService)
			   $state.go('logeado');
	        }, errorDeLogueo);
		};
		
		this.loguear = function (id)
		{
			DataService.usuario.id = id;
			DataService.usuario.nombre = self.usuarioLogueado.nombre;
		}
		
		function errorDeLogueo(error)
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
		this.noEsNombreValido=false;
		this.registroSinContrasenha=false;
		
		function errorDeRegistro(error)
		{
			console.log(error.data);
			switch (error.status)
			{
				case 400: 
					this.noEsNombreValido = true;
					console.log("Nombre de usuario inválido");
					break;
			}
		}
		
		this.registrar = function ()
		{
			if (this.contrasenha=="")
			{
				LoginService.guardar(this.usuarioARegistrar, function() 
					{
					this.usuarioARegistrar.nombre = this.nombre;
					this.usuarioARegistrar.password=this.contrasenha;
						this.notificarRegistro();
						console.log("Usuario registrado sin problemas")
					}, errorDeRegistro);
			}
			else 
			{
				registroSinContrasenha = true;
			}
			
		}
		
		this.notificarRegistro = function() 
		{
			// abrir un nuevo modal y cerrar el anterior;
		}
		
});
  