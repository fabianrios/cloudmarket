CMJS.controller( 'ProductsCtrl', ["$scope", "Product", "User", "Fridge", "$routeParams","$location", function($scope, Product, User, Fridge, $routeParams, $location) {
	$scope.products = Product.query();
    $scope.users = User.query();
	var characters = $location.absUrl().match(/users/);
	console.log($location.absUrl().substr(characters["index"]+6,1));
	$scope.fridges = Fridge.query({id: 1});
    $scope.orderProp = 'title';
	$scope.disponibilidad = true;
    return $scope.gPlace;
}]);