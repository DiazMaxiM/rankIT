rankitApp.factory('LoginService', function($resource) 
	{
		return $resource('/usuarios', {}, 
		{
			'login': { method: 'POST' },
			'guardar': { method: 'PUT' },
		});
		
		
});
