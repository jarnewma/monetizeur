import "bootstrap";

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

