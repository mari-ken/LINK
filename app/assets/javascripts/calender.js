$(function () {
  // 画面遷移を検知
  $(document).on('turbolinks:load', function () {
    // lengthを呼び出すことで、#calendarが存在していた場合はtrueの処理がされ、無い場合はnillを返す
    if ($('#calendar').length) {
      function eventCalendar() {
        return $('#calendar').fullCalendar({
        });
      };
      function clearCalendar() {
        $('#calendar').html('');
      };
      $(document).on('turbolinks:load', function () {
        eventCalendar();
      });
      $(document).on('turbolinks:before-cache', clearCalendar);

      $('#calendar').fullCalendar({
        selectable: true,
        header: {
          left: 'prev,next today',
          center: 'title',
          right: 'month,agendaWeek,agendaDay'
        },
        events: '/events.json',
        displayEventTime: false,
        select: function(startDate, endDate) {
          $('#new_event').modal('show');
          $(".input-start").val(moment(startDate).format("YYYY-MM-DD HH:mm"));
          $(".input-end").val(moment(endDate).format("YYYY-MM-DD HH:mm"));
        }
      });
    }
  });
});