rankitApp.service("CalificacionService", function () {

  this.buscar = function ($http,nombre,tipo,calificaciones,ranking,callback,errorHandler) {

    
    var estado =$http({
      url: 'http://localhost:9000/ranking?nombre='+nombre+'&tipo='+tipo+'&calificaciones='+calificaciones+'&ranking='+ranking,
      method: "GET",
      headers: {'Content-Type': 'application/x-www-form-urlencoded'}
    }).success(callback).error(errorHandler);
  };


});