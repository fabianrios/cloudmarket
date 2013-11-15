var app = angular.module("Cloud", ["ngResource"]);

app.directive('googleplace', function() {
    return {
        require: 'ngModel',
        link: function(scope, element, attrs, model) {
            var options = {
                types: [],
                componentRestrictions: {country: 'co'}
            };
            scope.gPlace = new google.maps.places.Autocomplete(element[0], options);

            google.maps.event.addListener(scope.gPlace, 'place_changed', function() {
                scope.$apply(function() {
                    model.$setViewValue(element.val());
                });
            });
        }
    };
});

app.factory("Product", [
    "$resource", function($resource) {
        return $resource("/store/index", {
            id: "@id"
        }, {
            update: {
                method: "PUT"
            }
        });
    }
]);


app.factory("User", [
    "$resource", function($resource) {
        return $resource("/users/:id", {
            id: "@id"
        }, {
            update: {
                method: "PUT"
            }
        });
    }
]);



this.ProductCtrl = [
    "$scope", "Product", "User",  function($scope, Product, User) {
        $scope.products = Product.query();
        $scope.users = User.query();
        $scope.orderProp = 'title';
        return $scope.gPlace;
    }
];