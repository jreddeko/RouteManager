var vm = new Vue({
    el: '#app',
    data: {
        routes: window.preLoadeddata.Routes,
        selectedRoute: window.preLoadeddata.Routes[0],
        days: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
        months: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
        orderTypes: ['Reg', 'Pet', 'Fridge'],
        test: ['1', '2'],
    },
    methods: {
        getRouteHref(item) {
            return '#' + item.RouteID;
        },
        displayRouteInfo(route) {
            this.selectedRoute = route;
        },

        dateTimeReviver(value) {
            var a;
            if (typeof value === 'string') {
                a = /\/Date\((\d*)\)\//.exec(value);
                if (a) {
                    return new Date(+a[1]);
                }
            }
            return value;
        },
        onSubmit(event) {
            $.ajax({
                type: 'POST',
                url: '/',
                data: JSON.stringify(this.selectedRoute),
                contentType: 'application/json; charset=utf-8',

                success: function (data) {
                    alert(data.success);
                },
                error: function (err) {
                    alert(err.responseText);
                }
            });
        }
    }
})
