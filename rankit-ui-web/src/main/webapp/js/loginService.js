rankitApp.factory('LoginService', function($resource) 
	{
		return $resource('/usuarios', {}, 
		{
			'guardar': { method: 'POST' },
		});
		
});
