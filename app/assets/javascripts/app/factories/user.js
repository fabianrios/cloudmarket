CMJS.factory("User", [
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