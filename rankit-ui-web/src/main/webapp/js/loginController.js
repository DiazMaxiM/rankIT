rankitApp.controller('LoginController', function ($scope,$timeout,$resource,LoginService,$state, DataService) 
{      
       var self=this;
       this.usuarioLogueado=new Object;
       this.nombre='';
       this.password='';
	   this.idUsuario=null;

	   
	   this.loguearUsuario = function () 
		{   
			LoginService.login(this.usuarioLogueado, function(data) {
			   self.loguear(data.id);
			   self.usuarioLogueado=new Object;
			   $state.go('logeado');
	        }, errorDeLogueo);
		};
		
		function errorDeLogueo(error){
//			 switch(error.status){
//			 case 400:
//				 self.notificarErrorLogueo("La password ingresada no es correcta");
//				 break;
//			 case 404:
//				 self.notificarErrorLogueo("No estás registrado en Rank-IT, Registrate ;)");
//				 break;
		//	 default:
			
			 self.notificarErrorLogueo(error.data.error);
		}
		}
		
		this.loguear = function (id)
		{
			DataService.usuario.id = id;
			DataService.usuario.nombre = this.usuarioLogueado.nombre;
		};
		
		this.elNombreDeUsuarioYaExiste = false;
		
		function errorDeRegistro(error)
		{   
			switch (error.status){
			case 400: 
				self.notificarError("Ya existe un usuario con el nombre" + " "+ self.nombre);
				break;
			case 404:
				self.notificarError("Registro incompleto");
				break;
				default:
			    
			}
		
			
		};
		
		this.registrar=function(){
			 $("#myModal").modal({});
		}
		
		this.registrarUsuario = function (){ 
			     this.usuarioARegistrar=new Object;
			     this.usuarioARegistrar.nombre=self.nombre;
			     this.usuarioARegistrar.password=self.password;
				LoginService.update(this.usuarioARegistrar, function(data) {
						self.notificarMensaje('El usuario'+ " "+ self.nombre+ " "+ 'ha sido registrado con exito');
						self.nombre='';
						self.password='';
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
	    
	    this.errorsLogueo = [];
	    this.notificarErrorLogueo = function(mensaje) {
	        this.errorsLogueo.push(mensaje);
	        this.notificar(this.errorsLogueo);
	    };
	    
		this.notificar = function(mensajes) 
		{
			$timeout(function() {
	            while (mensajes.length > 0) mensajes.pop();
	        }, 3000);
		}
		
});
  