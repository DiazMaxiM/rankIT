rankitApp.controller('LogueadoController', function ($resource,DataService,$state) 
{
	 this.nombre = DataService.usuario.nombre;
	 
	 this.calificar= function ($state){
	 	console.log("no pasa")
	 	$state.go('calificar');
	 }
	 
});
