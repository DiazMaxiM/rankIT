rankitApp.factory('LoginService', function($resource) 
	{
		return $resource('/usuarios', {}, 
		{
			'login': { method: 'POST' },
			'update': { method: 'PUT' }
		});
		
		
});
