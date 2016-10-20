rankitApp.controller('LogueadoController', function ($resource,UsuarioServicio,$state) {
	 this.calificar= function ($state){
	 	console.log("no pasa")
	 	$state.go('calificar');
	 }
	 this.nombre = UsuarioServicio.get();
});
