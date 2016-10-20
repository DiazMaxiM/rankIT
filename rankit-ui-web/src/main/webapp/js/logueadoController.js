rankitApp.controller('LogueadoController', function ($resource,UsuarioServicio) {
	 this.calificar= function (){
	 	$state.go('calificar');
	 }
	 this.nombre = UsuarioServicio.get();
});
