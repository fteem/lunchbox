lunchbox.controller("LunchesController", [ '$scope', 'Lunch', function($scope, Lunch){
  $scope.lunches = Lunch.query();
  $scope.lunch = new Lunch();

  $scope.saveLunch = function(){
    newLunch = { 
        name: $scope.lunch.name, 
        description: $scope.lunch.description,
        starts_on: $scope.lunch.startsOn,
        ends_on: $scope.lunch.endsOn
    }
    lunch = Lunch.save(newLunch)
    $scope.lunches.push(lunch)
  };


}]);