rankitApp.factory('Calificacion', function($resource) {
    return $resource('/calificaciones/:id', {'id': '@id'}, {
    	'query': { method: 'GET', isArray: true},
        'remove': { method:'DELETE' }
    });
});


rankitApp.factory('ActualizarCalificacion', function($resource) {
    return $resource('/calificaciones', {}, {
         'save': { method: 'POST' },
         'update': { method: 'PUT' }
    });
});



rankitApp.factory('Evaluados', function($resource) {
    return $resource('/evaluados', {}, {
    	'query': { method: 'GET', isArray:true},

    });
});
