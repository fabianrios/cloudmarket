CMJS.controller( 'ProductsCtrl', ["$scope", "Product", "User",  function($scope, Product, User) {
    $scope.products = Product.query();
    $scope.users = User.query();
    $scope.orderProp = 'title';
    return $scope.gPlace;
}]);