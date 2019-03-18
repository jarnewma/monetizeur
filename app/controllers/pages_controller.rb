class PagesController < ApplicationController

skip_before_action :authenticate_user!, only: :home

  def home
  end

  def calendar
    @subscriptions = current_user.subscriptions
    @one_year_events = []
    @subscriptions.each do |event|

      if event.subscription_type == "Monthly"
        i = 0
      24.times do
          fake_event = event.dup
          fake_event.billing_date = event.billing_date + i.months
          fake_event.id = event.id
          @one_year_events << fake_event.to_json
          i += 1
        end
      elsif event.subscription_type == "Quarterly"
        i = 0
        8.times do
          fake_event = event.dup
          fake_event.billing_date = event.billing_date + i.months
          fake_event.id = event.id
          @one_year_events << fake_event.to_json
          i += 3
        end
      elsif event.subscription_type == "Biannually"
        i = 0
        4.times do
          fake_event = event.dup
          fake_event.billing_date = event.billing_date + i.months
          fake_event.id = event.id
          @one_year_events << fake_event.to_json
          i += 6
        end
      elsif event.subscription_type == "Annually"
        i = 0
        2.times do
          fake_event = event.dup
          fake_event.billing_date = event.billing_date + i.months
          fake_event.id = event.id
          @one_year_events << fake_event.to_json
          i += 12
        end
      end
    end
    @one_year_events.to_json
  end

  def my_profile
    @users = current_user
    @payment_methods = current_user.payment_methods
  end

  def analysis
    @users = current_user
    @subscriptions_all = current_user.subscriptions
    @subscriptions = current_user.subscriptions.select{|sub| sub.subs_month(Date.today)}
    @sub_cat = @subscriptions.group_by(&:category)
    @pie_chart_data_this_month = []
    @sub_cat.each do |month, sub_array|
      month_value = sub_array.inject(0) {|sum, sub| sum + sub.cost}
    @pie_chart_data_this_month << [month, month_value]


    @pie_chart_data_this_year = []
    @sub_cat.each do |year, sub_array|
      year_value = sub_array.inject(0) {|sum, sub| sum + sub.cost}
    @pie_chart_data_this_year << [year, year_value]
  end
end

    p @sub_cat
  end
end
