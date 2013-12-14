

CMJS.factory("Fridge", [
    "$resource", function($resource) {
        return $resource("/users/:id/products", {
            id: "@id"
        }, {
            update: {
                method: "PUT"
            },
			create: {
				method: "POST"
			}
        });
    }
]);


