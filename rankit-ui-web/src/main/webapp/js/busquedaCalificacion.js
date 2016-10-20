rankitApp.controller('BusquedaCalificacionController', function ($resource,Busqueda) {
  self=this
  this.ranking=[];

 this.criterioBusqueda= new Object


  this.criterioBusqueda.tipoPuntuable = {
 	opciones: [
 	{id: ''        , name: 'Todos'},
 	{id: 'SERVICIO', name: 'Servicio'},
 	{id: 'LUGAR'   , name: 'Lugar'}
 	]
 };
 this.buscar= function(){
 	 
 	 Busqueda.query(self.criterioBusqueda,function(data) {
	 self.ranking=data
	 }, errorBusqueda);
	 
 }
 this.busquedaOk = function (data){
 	console.log("paso?")
 	
 }
 
function errorBusqueda(error) {
       console.log(error.data);
}

});

rankitApp.factory('Busqueda', function($resource) {
     return $resource('http://localhost:9000/ranking', {}, {
     	'query': { method: 'GET', isArray: true}
     });
});
