rankitApp.service("LoginService", function () {

  this.usuario ="";
  this.password ="";

  this.login = function ($http,nombre,password,callback,errorHandler) {
    
    var data = {}
    data.nombre = nombre
    data.password = password

    var estado =$http({
            url: 'http://localhost:9000/usuarios',
            method: "POST",
            data: data,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
}).success(callback).error(errorHandler);
  };


});