class UserMailer < ApplicationMailer
  def notification(sub_id)
    @subscription = Subscription.find sub_id
    @user =  @subscription.user # Instance variable => available in view

    mail(to: @user.email, subject: "Subscription notification - #{@subscription.name}")
    # This will render a view in `app/views/user_mailer`!
  end
end
