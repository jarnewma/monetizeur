import "bootstrap";
import 'fullcalendar'
import Pikaday from 'pikaday';
import selectNotificationDate from './form_subscription';
import selectDropdown from './select_dropdown';
import { initUpdateNavbarOnScroll } from './navbar';
// import { initUpdateBannerOnScroll } from './banner';

const landingNavbar = document.querySelector('.navbar-lewagon')
if (landingNavbar) {
  initUpdateNavbarOnScroll();
}

// const transparent = document.querySelector('.transparent')
// if (transparent) {
//   initUpdateNavbarOnScroll();
// }


require('./my_calendar')

function addDPickerSubs(){

var picker = new Pikaday({ field: document.getElementById('subscription_creation_date') });
var picker = new Pikaday({ field: document.getElementById('subscription_creation_date') });
var picker = new Pikaday({ field: document.getElementById('subscription_billing_date') });
var picker = new Pikaday({ field: document.getElementById('subscription_trial_date_until') });
}
 addDPickerSubs();

const subscriptionForm = document.querySelector('#new_subscription')
if (subscriptionForm) {
 selectNotificationDate()
}

function getEventNotif(){
  document.getElementById('subscription_renewal_notification').addEventListener('click', (e) => {
    // e.preventDefault();
    document.getElementById('notif').classList.toggle('hidden')
    if(document.getElementById('subscription_notification_date').value == "" ) {
    var picker = new Pikaday({
      field: document.getElementById('subscription_notification_date'),
       });
    console.log('HEKWJRH')
    let new_date = new Date(document.getElementById('subscription_billing_date').value)
    new_date.setDate(new_date.getDate() -  1);

   picker.setDate(new_date)
    document.getElementById('subscription_notification_date').click();
   }
  })

}
if( document.getElementById('subscription_renewal_notification')){

  getEventNotif();
}

selectDropdown()

let firstFieldForm = document.querySelector('#nameDropdown')
if (firstFieldForm) { firstFieldForm.focus() }
