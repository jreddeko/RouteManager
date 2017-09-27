var vm = new Vue({
    el: '#app',
    data: {
        routes: window.preLoadeddata.Routes,
        calendar: window.preLoadeddata.Calendar,
        routeOriginal: window.preLoadeddata.Routes[0], // selected route
        routeChanged: JSON.parse(JSON.stringify(window.preLoadeddata.Routes[0])), // any changes to route goes here
    },
    methods: {
        displayRouteInfo(route) {
            if (!this.objectsEqual(this.routeOriginal, this.routeChanged)) {
                if (confirm('Do you want to save your changes?')) {
                    this.onSubmit(route);
                }
            }
            this.routeOriginal = route;
            this.routeChanged = JSON.parse(JSON.stringify(route));
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

        onSubmit(route) {
            if (this.objectsEqual(this.routeOriginal, this.routeChanged)) {
                var alertWarning = document.getElementById('alert-warning');
                $(alertWarning).fadeIn("slow")
                    .delay(3000)
                    .fadeOut('slow');
            }
            else {
                startSpin();
                $.ajax({
                    context: this,
                    type: 'POST',
                    url: '',
                    data: JSON.stringify(this.routeChanged),
                    contentType: 'application/json; charset=utf-8',

                    success: function (data) {
                        this.routes = data.routes;
                        var newRoute = this.routes.filter(function (ele) {
                            return ele.RouteID === route.RouteID;
                        })[0];

                        this.routeOriginal = newRoute;
                        this.routeChanged = JSON.parse(JSON.stringify(route));
                        $('#loading-indicator').hide();
                        stopSpin();

                        var alertSuccess = document.getElementById('alert-sucess');
                        $(alertSuccess).fadeIn("slow")
                            .delay(3000)
                            .fadeOut('slow');
                    },
                    error: function (err) {
                        this.routeChanged = this.routeOriginal;
                        alert(err.responseText);
                        stopSpin();
                        var alertFailure = document.getElementById('alert-failure');
                        $(alertFailure).fadeIn("slow")
                            .delay(3000)
                            .fadeOut('slow');
                    }
                });
            }
        },
        getDefaultDeliveryDate(day, siteOrderType) {
            return siteOrderType.DeliveryDateDefaults.filter(function (ele) {
                return day.DayOfWorkWeek === ele.DayOfWeek;
            })[0];
        },
        getDeliveryDate(day, siteOrderType) {
            var deliveryDateDefault = this.getDefaultDeliveryDate(day, siteOrderType);
            var deliveryDateException = this.getException(day, deliveryDateDefault);
            return deliveryDateException == null ? deliveryDateDefault : deliveryDateException;
        },
        isException(day, siteOrderType) {
            return this.getException(day, this.getDefaultDeliveryDate(day, siteOrderType)) == null ? false : true;
        },
        getException(day, deliveryDate) {

            var exceptions = deliveryDate.DeliveryDateExceptions.filter(function (ele) {
                return day.DateString === ele.DateString;
            });
            if (exceptions.length === 1) {
                return exceptions[0];
            }
            return null;
        },
        objectsEqual(obj1, obj2) {
            return JSON.stringify(obj1) === JSON.stringify(obj2) ? true : false;
        },
        isActive(routeID) {
            return this.routeOriginal.RouteID == routeID;
        },
    }
})
