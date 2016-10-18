'use strict';
	var app = angular.module('RegistroController', []);

	app.controller('RegistroCtrl', function ($scope) 
	{	
	    $scope.usuariosRegistrados =[{nombre:"Camila", contrasenha:"1234"}, {nombre:"Liza", contrasenha:"5678"}];
		
		$scope.cantUsuarios = function() {
			return $scope.usuariosRegistrados.length;
		}
	
		$scope.registrarUsuario = function()
		{
			$scope.usuariosRegistrados.push({nombre: $scope.nombre, contrasenha: $scope.contrasenha})
		}
		
		$scope.pepe = function() {return $scope.registroSinNombre;}
		$scope.nombre ="";
		$scope.contrasenha="";
		$scope.captcha;
		$scope.registroSinNombre = false;
		$scope.registroSinContrasenha = false;
		
		$scope.nombreExistente = function(cantidadDeElementos) 
			{
				if (cantidadDeElementos == 0)
				{
					return ($scope.usuariosRegistrados[cantidadDeElementos].nombre == $scope.nombre);
				}
				else 
				{
					return ($scope.usuariosRegistrados[cantidadDeElementos].nombre == $scope.nombre) || ($scope.nombreExistente(cantidadDeElementos-1));
				}
			}
		
		$scope.elNombreYaExiste = function()
		{
			return $scope.nombreExistente($scope.cantUsuarios()-1);
		}
		
		$scope.noTieneNombre = function()
		{
			return ($scope.nombre.length == 0);
		}
		
		$scope.noTieneContrasenha = function()
		{
			return $scope.contrasenha.length == 0;
		}
		
		$scope.nombreNoPermitido = function() 
			{
				return $scope.nombre == "NN";
			}
		
		$scope.noHayNombreValido = function () 
			{
				return ($scope.elNombreYaExiste() || $scope.nombreNoPermitido());
			}
		
		$scope.noHayUnRegistroValidoIngresado = function() 
			{	
				return $scope.noTieneNombre() || $scope.noTieneContrasenha();
			}
		
		$scope.registrarUsuarioSiPuede = function() 
			{
				if ($scope.noHayUnRegistroValidoIngresado())
				{
					$scope.registroSinNombre = $scope.noTieneNombre();
					$scope.registroSinContrasenha = $scope.noTieneContrasenha();				
				}
				else 
				{
					$scope.registrarUsuario();
					$scope.nombre ="";
					$scope.contrasenha="";
				}
			}
		
		
		$scope.actualizacionDeErrorNombre = function() 
		{
			$scope.registroSinNombre = $scope.noTieneNombre();
		}
		
		$scope.actualizacionDeErrorContrasenha = function() 
		{
			$scope.registroSinContrasenha = $scope.noTieneContrasenha();
		}
		
	}
);