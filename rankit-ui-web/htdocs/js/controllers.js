rankitApp.controller('CalificacionController',function($http,CalificacionService)){
    var self=this;
    this.getEvaluados=function(){
      calificacionService.evaluados(function(data)){
           self.evaluados=data;
         });
      
    }
    this.getEvaluados(); 


}):
