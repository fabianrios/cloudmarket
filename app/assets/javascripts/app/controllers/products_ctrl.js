CMJS.controller( 'ProductsCtrl', ["$scope", "Product", "User", "Fridge", "$routeParams","$location", function($scope, Product, User, Fridge, $routeParams, $location) {
	
	
	$scope.products = Product.query();
    $scope.users = User.query();
    $scope.sortableOptions = {
       handle: '.handle',
	   placeholder: "ui-state-highlight"
     };
	
	if($location.absUrl().match(/users/)){
		var characters = $location.absUrl().match(/users/);
		$scope.fridges = Fridge.query({id: $location.absUrl().substr(characters["index"]+6,1)});
	}
    $scope.orderProp = 'title';
    return $scope.gPlace;
	
}]);