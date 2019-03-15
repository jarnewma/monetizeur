
// marie.forEach(item => {
//   console.log(item)
// })
const calendarObject = document.getElementById('calendar')

const computeEvent = (subscription) => {
  return {
    title: subscription.name,
    start: subscription.billing_date,
    backgroundColor: computeColor(subscription),
    url: computeUrl(subscription)
  }
}

const computeColor = (subscription) => {
  const categories = {
    "News & Media": "#C42D2B",
    "Health & Wellness": "#5CB566",
    "Streaming": "#72C6E0",
    "Sports & Leisure": "#20325E",
    "Social": "#FFA544",
    "Shopping": "#E892A3",
    "Food": "#FFE74C",
    "Technology": "#989C94",
    "Other": "#624763"
  }
  return categories[subscription.category]
}

const computeUrl = (subscription) => {
  return `/subscriptions/${subscription.id}`
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
    events: calendar,
    backgroundColor: 'red'
  })


  $('#previous-month').click(function() {
    $('#calendar').fullCalendar('prev');
  });

  $('#next-month').click(function() {
    $('#calendar').fullCalendar('next');
  });

}



