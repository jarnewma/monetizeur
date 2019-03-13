
// marie.forEach(item => {
//   console.log(item)
// })
const calendarData = document.getElementById('calendar').dataset
const subscriptions = JSON.parse(calendarData.subscriptions)

console.log(subscriptions[0].name)
console.log(subscriptions[0].cost)

$('#calendar').fullCalendar({
  // put your options and callbacks here
})
