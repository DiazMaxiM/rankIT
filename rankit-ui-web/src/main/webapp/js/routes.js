rankitApp.config(function ($stateProvider, $urlRouterProvider) {

  $urlRouterProvider.otherwise("/");

  $stateProvider
  .state('inicio',{
   url: '/',
   views: {
    'mainPanel': {
      templateUrl: "partials/busquedaCalificacion.html",
      controller: "BusquedaCalificacionController as busqCalificacionCtrl"
    }
  }
}
)
});