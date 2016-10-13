rankitApp.config(function ($stateProvider, $urlRouterProvider) {

  $urlRouterProvider.otherwise("/");

    $stateProvider
  .state('agregarTarea',{
     url: '/',
    views: {
      'main': {
      templateUrl: "partials/agregar_tarea.html",
      controller: "AgregarTareaController as tareasCtrl"
              },
      'loginPanel': {
      templateUrl: "partials/login.html",
      controller: "LoginController as loginCtrl"
              }
          }
        }
      )
    .state('editarTarea', {
      url: "/tarea/:id",
      templateUrl: "partials/editar_tarea.html",
      controller: "EditarTareaController as editarCtrl"
    })


});