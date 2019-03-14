import "bootstrap";
import 'fullcalendar';

import Pikaday from 'pikaday';
import selectNotificationDate from './form_subscription';

function addDPickerSubs(){

var picker = new Pikaday({ field: document.getElementById('subscription_creation_date') });
var picker = new Pikaday({ field: document.getElementById('subscription_notification_date') });
var picker = new Pikaday({ field: document.getElementById('subscription_creation_date') });
var picker = new Pikaday({ field: document.getElementById('subscription_billing_date') });

}
 addDPickerSubs();

const subscriptionForm = document.querySelector('#new_subscription')
if (subscriptionForm) {
 selectNotificationDate()
}

function getEventNotif(){
  document.getElementById('subscription_renewal_notification').addEventListener('click', (e) => {
    e.preventDefault();
    document.getElementById('notif').classList.toggle('hidden')
    document.getElementById('subscription_notification_date').click();

  })

}
if( document.getElementById('subscription_renewal_notification')){

  getEventNotif();
}
