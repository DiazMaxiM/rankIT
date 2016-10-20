rankitApp.controller('LoginController', function ($resource) {
	 var self = this;
	 this.logeado = false
	 this.error =""
	 this.logear =function(){}

	 this.loginOk = function (data){
	 	self.logeado = true

	 }
	 this.errorLogin = function (data){
	 	self.logeado=false
	 	modalError("Error Login",data.error)
	 }
});
