class PagesController < ApplicationController
  def home
  end

  def calendar
    @subscriptions = current_user.subscriptions
    @one_year_events = []
    @subscriptions.each do |event|
      if event.billing_date
        i = 1
        11.times do
          fake_event = event.dup
          fake_event.billing_date = event.billing_date + i.months
          @one_year_events << fake_event.to_json
          i += 1
        end
      end
    end
    @one_year_events.to_json
  end
end
