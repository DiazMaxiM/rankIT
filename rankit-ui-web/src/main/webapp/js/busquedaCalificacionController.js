rankitApp.controller('BusquedaCalificacionController', function($resource,
		Busqueda, $state) {
	self = this
	this.ranking = [];

	this.criterioBusqueda = new Object

	this.criterioBusqueda

	this.limpiar= function (){
		this.criterioBusqueda={};
	}
	
	this.tipoPuntuable = {
		opciones : [ {
			id : '',
			name : 'Todos'
		}, {
			id : 'SERVICIO',
			name : 'Servicio'
		}, {
			id : 'LUGAR',
			name : 'Lugar'
		} ]
	};
	this.buscar = function() {

		Busqueda.query(self.criterioBusqueda, function(data) {
			self.ranking = data
		}, errorBusqueda);

	}

	function errorBusqueda(error) {
		console.log(error.data);
	}

});

rankitApp.factory('Busqueda', function($resource) {
	return $resource('/ranking', {}, {
		'query' : {
			method : 'GET',
			isArray : true
		}
	});
});
