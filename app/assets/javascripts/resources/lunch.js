lunchbox.factory("Lunch", ['$resource', function($resource){
  return $resource("/api/v1/lunches/:id", 
    {id: '@id'}
  )
}]);