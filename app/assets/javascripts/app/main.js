var CMJS = angular.module( 'Cloud', ["ngResource", "ui.sortable", "ngRoute"])
 .config(['$routeProvider', '$locationProvider' ,function($routeProvider, $locationProvider) {
        $routeProvider
            .when('/users/:id/products', {controller: 'ProductsCtrl'})
            .otherwise({redirectTo: '/'});
}]);

