rankitApp.factory('Logueo', function($resource) {
     return $resource('/usuarios', {}, {
    	 'save': { method: 'POST' },
     });
});