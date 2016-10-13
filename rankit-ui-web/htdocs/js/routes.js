rankitApp.config(function ($stateProvider, $urlRouterProvider) {

  $urlRouterProvider.otherwise("/");

  $stateProvider
  .state('inicio',{
   url: '/',
   views: {
    'mainPanel': {
      //templateUrl: "partials/agregar_tarea.html",
      //controller: "AgregarTareaController as tareasCtrl"
    },
    'loginPanel': {
      templateUrl: "partials/login.html",
      controller: "LoginController as loginCtrl"
    }
  }
}
)
});