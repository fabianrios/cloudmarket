CMJS.factory("Product", [
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