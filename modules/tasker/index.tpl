
<script>

    $(document).ready(function() {

        $('#calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            lang: 'ru',
//            убрать выходные
//            weekends: false,
            editable: true,
            aspectRatio: 2,
            eventLimit: true, // allow "more" link when too many events
//            dayClick: function(date, jsEvent, view) {
//                $(this).css('background-color', 'red');
//
//            },
            selectable: true,
            //HZ
//            eventDrop: function(event, delta, revertFunc, ui, view) {
//
//            },
            events: [
                {
                    title: 'All Day Event',
                    start: '2014-09-01',
                    color: '#ccc',
                    textColor: 'yellow'
                },
                {
                    title: 'Long Event',
                    start: '2014-09-07',
                    end: '2014-09-10'
                },
                {
                    id: 999,
                    title: 'Repeating Event',
                    start: '2014-09-09T16:00:00'
                },
                {
                    id: 999,
                    title: 'Repeating Event',
                    start: '2014-09-16T16:00:00'
                },
                {
                    title: 'Conference',
                    start: '2014-09-11',
                    end: '2014-09-13'
                },
                {
                    title: 'Meeting',
                    start: '2014-09-12T10:30:00',
                    end: '2014-09-12T12:30:00'
                },
                {
                    title: 'Lunch',
                    start: '2014-09-12T12:00:00'
                },
                {
                    title: 'Meeting',
                    start: '2014-09-12T14:30:00'
                },
                {
                    title: 'Happy Hour',
                    start: '2014-09-12T17:30:00'
                },
                {
                    title: 'Dinner',
                    start: '2014-09-12T20:00:00'
                },
                {
                    title: 'Birthday Party',
                    start: '2014-09-13T07:00:00'
                }

            ]
        });
        //$('#calendar').fullCalendar( 'gotoDate','2014-09-15');

    });

</script>
<h1>Таскер!!!</h1>
<a href="#">Добавить таск</a>
<div id='calendar'></div>