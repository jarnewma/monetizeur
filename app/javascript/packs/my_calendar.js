
// marie.forEach(item => {
//   console.log(item)
// })
const calendarObject = document.getElementById('calendar')
if (calendarObject) {
  const subscriptions = JSON.parse(calendarObject.dataset.subscriptions)
  console.log(subscriptions)
  let calendar = []
  subscriptions.forEach(sub => {
    subscription = JSON.parse(sub)
    calendar.push({title: subscription.name, start: subscription.billing_date})
  })
  console.log(calendar)



  $('#calendar').fullCalendar({
    // put your options and callbacks here
    events : calendar
  })


$('#previous-month').click(function() {
  $('#calendar').fullCalendar('prev');
});

$('#next-month').click(function() {
  $('#calendar').fullCalendar('next');
});


}

