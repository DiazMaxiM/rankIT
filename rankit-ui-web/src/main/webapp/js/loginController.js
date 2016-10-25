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
		
		this.noEsNombreValido=false;
		this.errorDeNombreVacio = false;
		this.errorDeContrasenhaVacia = false;
		
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
			if (! this.registroNoValido())
			{
				LoginService.guardar(this.usuarioARegistrar, function(data) 
					{
						this.notificarRegistro('El usuario' + this.usuarioARegistrar.nombre + 'ha sido registrado con exito');
						this.usuarioARegistrar = null;
						console.log("Usuario registrado sin problemas")
					}, errorDeRegistro);
			}
			else 
			{
				this.mostrarErrores();
			}
			
		}
		
		this.mostrarErrores = function () 
		{
			if (this.noHayUnNombreIngresado)
			{
				this.errorDeNombreVacio = true;
			}
			else 
			{
				this.errorDeContrasenhaVacia = true;
			}
		}
		
		this.registroNoValido = function () 
		{
			return this.noHayNombreIngresado || this.noHayContrasenhaIngresada;
		}
		
		this.noHayUnNombreIngresado = function()
		{
			return this.usuarioARegistrar.nombre == "" ;
		}
		
		this.noHayContrasenhaIngresada = function () 
		{
			return this.usuarioARegistrar.password=="";
		}
		
		
		this.msgs = [];
		
		this.notificarRegistro = function(mensaje) {
	        this.msgs.push(mensaje);
	        this.notificar(this.msgs);
	    };
		
		this.notificar = function(mensajes) 
		{
			$timeout(function() {
	            while (mensajes.length > 0) mensajes.pop();
	        }, 3000);
		}
		
});
  