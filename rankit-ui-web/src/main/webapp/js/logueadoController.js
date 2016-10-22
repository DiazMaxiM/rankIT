rankitApp.controller('LogueadoController', function (DataService,$state) 
{
	 this.nombre = DataService.usuario.nombre;
	 
	 this.calificar= function (){
	 	console.log("calificaciones del usuario");
	 	$state.go('calificar');
	 };
	 
	 this.desloguear= function (){
		 	console.log("Deslogueo");
		 	DataService.usuario.nombre=""
		 	$state.go('inicio');
		 };
	 
});
