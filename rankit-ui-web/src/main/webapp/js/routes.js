rankitApp.config(function ($stateProvider, $urlRouterProvider) {

  $urlRouterProvider.otherwise("/");

  $stateProvider
  .state('inicio',{
   url: '/',
   views: {
    'mainPanel': {
      templateUrl: "partials/busquedaCalificacion.html",
      controller: "BusquedaCalificacionController as busqCalificacionCtrl"
    },
    'loginPanel': {
      templateUrl: "partials/login.html",
      controller: "LoginController as loginCtrl"
    }
  }
}
)
.state('logeado',{
   url: '/logeado',
   views: {
    'mainPanel': {
      templateUrl: "partials/busquedaCalificacion.html",
      controller: "BusquedaCalificacionController as busqCalificacionCtrl"
    },
   'loginPanel': {
      templateUrl: "partials/logueado.html",
      controller: "LogueadoController as logueadoCtrl"
    }
  }
}
)
.state('calificar',{
   url: '/calificar',
   views: {
   'mainPanel': {
      templateUrl: "partials/calificar.html",
      controller: "CalificacionController as CalificacionCtrl"
    },
    'loginPanel': {
        templateUrl: "partials/logueado.html",
        controller: "LogueadoController as logueadoCtrl"
      }
  }
}
)
});