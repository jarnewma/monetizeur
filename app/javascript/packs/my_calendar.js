
// marie.forEach(item => {
//   console.log(item)
// })
const calendarObject = document.getElementById('calendar')

const computeEvent = (subscription) => {
  return {
    title: computeName(subscription),
    start: subscription.billing_date,
    backgroundColor: computeColor(subscription),
    url: computeUrl(subscription),
    textColor: 'white !important',
    borderColor: 'white !important'
  }
}
const computeName = (subscription) => {
  return `${subscription.name}    ${subscription.cost} €`
}

const computeColor = (subscription) => {
  const categories = {

    "Media": "#C42D2B !important",
    "Wellbeing": "#5CB566 !important",
    "Streaming": "#72C6E0 !important",
    "Leisure": "#20325E !important",
    "Social": "#FFA544 !important",
    "Shopping": "#E892A3 !important",
    "Food": "#FFE74C !important",
    "Technology": "#989C94 !important",
    "Other": "#624763!important",
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
  })


  $('#previous-month').click(function() {
    $('#calendar').fullCalendar('prev');
  });

  $('#next-month').click(function() {
    $('#calendar').fullCalendar('next');
  });

}



