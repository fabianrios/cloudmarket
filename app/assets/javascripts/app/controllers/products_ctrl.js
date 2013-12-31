CMJS.controller( 'ProductsCtrl', ["$scope", "Product", "User", "Fridge", "$routeParams","$location", function($scope, Product, User, Fridge, $routeParams, $location) {
	
	
	$scope.products = Product.query();
    $scope.users = User.query();
    $scope.sortableOptions = {
       handle: '.handle',
	   placeholder: "ui-state-highlight"
     };
	 //estoy sacando la url y luego de la url sacando el id para pasarselo al query
	if($location.absUrl().match(/users/)){
		var characters = $location.absUrl().match(/users/);
		$scope.fridges = Fridge.query({id: $location.absUrl().substr(characters["index"]+6,1)});
	}
	
	$scope.getPrice = function(){
		var sum = 0;
		for( t=0; t < $scope.fridges.length; t++) { 
			sum += $scope.fridges[t].price << 0;
			console.log($scope.fridges[t].price)
		}
		return sum.toFixed(0);
	}
	
    $scope.orderProp = 'title';
	
    return $scope.gPlace;
	
}]);