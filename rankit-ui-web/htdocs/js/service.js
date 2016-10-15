rankitApp.service("CalificacionService", function ($http) {

      this.evaluados=function(callback){
      	   $http.get('/evaluados').then(callback);
      }


});
