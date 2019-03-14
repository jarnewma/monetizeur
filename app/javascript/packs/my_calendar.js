
// marie.forEach(item => {
//   console.log(item)
// })
const calendarObject = document.getElementById('calendar')

if (calendarObject) {
  const subscriptions = JSON.parse(calendarObject.dataset.subscriptions)
  console.log(subscriptions)
  console.log(subscriptions[0].cost)
  // let sub = subscriptions.map(x => { { title: x.name, start_date: x.subscription_date } })


  $('#calendar').fullCalendar({
    // put your options and callbacks here
    event : [
      // {
      //   title: "test",
      //   start_date: "12 Mar 2019"
      // }
    ]
     // resources: [ sub ]
  })


$('#previous-month').click(function() {
  $('#calendar').fullCalendar('prev');
});

$('#next-month').click(function() {
  $('#calendar').fullCalendar('next');
});


}

