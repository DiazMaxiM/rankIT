rankitApp.controller('LoginController', function ($scope,$timeout,$resource,LoginService,$state, DataService) 
{      
       var self=this;
	   this.usuarioLogueado= new Object;
	   this.usuarioARegistrar= new Object;
       this.idUsuario=null;
       this.nombre=null;
       this.password=null;
	   
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
		};
		
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
		};
		
		
		function errorDeRegistro(error)
		{   
			self.notificarError(error.data);
		
			
		};
		
		this.registrar = function ()
		{       self.usuarioARegistrar.nombre=self.nombre;
		        self.usuarioARegistrar.password=self.password;
				LoginService.guardar(this.usuarioARegistrar, function(data) 
					{
						self.notificarMensaje('El usuario' + this.usuarioARegistrar.nombre + 'ha sido registrado con exito');
                        self.nombre=null;
                        self.password=null;
						self.usuarioARegistrar = new Object;
					}, errorDeRegistro);

		};
		
		
		//resultados y errores al  logear o registrar usuarios
	    this.msgs = [];
	    this.notificarMensaje = function(mensaje) {
	        this.msgs.push(mensaje);
	        this.notificar(this.msgs);
	    };

	    this.errors = [];
	    this.notificarError = function(mensaje) {
	        this.errors.push(mensaje);
	        this.notificar(this.errors);
	    };
		
		this.notificar = function(mensajes) 
		{
			$timeout(function() {
	            while (mensajes.length > 0) mensajes.pop();
	        }, 3000);
		}
		
});
  