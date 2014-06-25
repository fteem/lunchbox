app.controller("LunchesController", [ '$http', function($http){
  var that = this;
  this.lunches = {};
  this.errors = {};

  $http({method: 'GET', url: '/api/v1/lunches'}).
    success(function(data, status, headers, config) {
      that.lunches = data;
    }).
    error(function(data, status, headers, config) {
      that.errors = data;
    });
}]);