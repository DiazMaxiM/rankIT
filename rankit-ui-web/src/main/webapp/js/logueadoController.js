rankitApp.controller('LogueadoController', function (DataService,$state) 
{
	 this.nombre = DataService.usuario.nombre;
	 
	 this.calificar= function (){
	 	$state.go('calificar');
	 };
	 
	 this.desloguear= function (){
		 	DataService.usuario.nombre=""
		 	$state.go('inicio');
		 };
	 
});
