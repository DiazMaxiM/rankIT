'use strict';

var rankitApp = angular.module('rankitApp', ['ui.router','ngResource','ui.bootstrap']);

rankitApp.factory('DataService', function()
{
	return { usuario:{} };
});

