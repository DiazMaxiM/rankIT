rankitApp.factory('Calificacion', function($resource) {
    return $resource('/calificaciones', {}, {
          'update': { method: 'PUT' }
    });
});
