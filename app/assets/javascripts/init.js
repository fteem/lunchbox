var lunchbox = angular.module('lunchbox', ['ngResource']);

lunchbox.config(["$httpProvider", function($httpProvider){
  $httpProvider.defaults.headers.common['Accept'] = "application/json"
}]);
