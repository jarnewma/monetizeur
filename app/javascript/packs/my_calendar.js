
// marie.forEach(item => {
//   console.log(item)
// })
const calendarObject = document.getElementById('calendar')

const computeEvent = (subscription) => {
  return {
    title: subscription.name,
    start: subscription.billing_date,
    backgroundColor: computeColor(subscription)
  }
}

const computeColor = (subscription) => {
  const categories = {
    "Media": "#C42D2B",
    "Wellbeing": "#5CB566",
    "Streaming": "#72C6E0",
    "Leisure": "#20325E",
    "Social": "#FFA544",
    "Shopping": "#E892A3",
    "Food": "#FFE74C",
    "Technology": "#989C94",
    "Other": "#624763"
  }
  return categories[subscription.category]
}

const computeUrl = (subscription) => {
  return
}

if (calendarObject) {
  const subscriptions = JSON.parse(calendarObject.dataset.subscriptions)
  console.log(subscriptions)
  let calendar = []
  subscriptions.forEach(sub => {
    subscription = JSON.parse(sub)
    calendar.push(computeEvent(subscription))
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



