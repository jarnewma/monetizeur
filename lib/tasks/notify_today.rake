namespace :user do
  desc "Send notification when due"
  task :update_all => :environment do
    Subscription.all.each do |subscription|
      if subscription.notify_today
        UserMailer.notification(subscription.user).deliver_now
       end
    end
  end
end
