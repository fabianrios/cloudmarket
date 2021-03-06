CMJS.directive('googleplace', function() {
    return {
        require: 'ngModel',
        link: function(scope, element, attrs, model) {
            var options = {
                types: [],
                componentRestrictions: {country: 'co'}
            };
            scope.gPlace = new google.maps.places.Autocomplete(element[0], options);
			
            google.maps.event.addListener(scope.gPlace, 'place_changed', function(event) {
                scope.$apply(function() {
                    model.$setViewValue(element.val());
                });
            });
        }
    };
});