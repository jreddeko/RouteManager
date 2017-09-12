Vue.component('route-day', {
    props: ['dayOfWeek'],
    template: '<th><span class="day">{{dayOfWeek.dateNumber}}</span><span class="long">{{dayOfWeek.dayText}}</span><span class="short">{{dayOfWeek.dayTextShort}}</span></th>'
});

var vm = new Vue({
    el: '#app',
    data: {
        dayList: [
          { id: 0, dateNumber: '1', dayText: 'Monday', dayTextShort: 'Mon' },
          { id: 0, dateNumber: '2', dayText: 'Tuesday', dayTextShort: 'Tue' },
          { id: 0, dateNumber: '3', dayText: 'Wendsday', dayTextShort: 'Wed' },
          { id: 0, dateNumber: '4', dayText: 'Thursday', dayTextShort: 'Thur' },
          { id: 0, dateNumber: '5', dayText: 'Friday', dayTextShort: 'Fri' },
          { id: 0, dateNumber: '6', dayText: 'Saturday', dayTextShort: 'Sat' },
          { id: 0, dateNumber: '7', dayText: 'Sunday', dayTextShort: 'Sun' },
        ]
    }
});