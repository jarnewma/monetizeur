
// marie.forEach(item => {
//   console.log(item)
// })
const subscriptions = document.getElementById('calendar').dataset.subscriptions
console.log(JSON.parse(subscriptions))

$('#calendar').fullCalendar({
  // put your options and callbacks here
})
