rankitApp.factory('Calificacion', function($resource) {
    return $resource('/calificaciones/:id', {'id': '@id'}, {
    	'query': { method: 'GET', isArray: true},
        'update': { method: 'PUT' },
        'save': { method: 'POST' },
        'remove': { method:'DELETE' }
    });
});




rankitApp.factory('Evaluados', function($resource) {
    return $resource('/evaluados', {}, {
    	'query': { method: 'GET', isArray:true},

    });
});
