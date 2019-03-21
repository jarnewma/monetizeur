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
    @subscriptions_all = current_user.subscriptions
    @subscriptions = current_user.subscriptions.select{|sub| sub.subs_month(Date.today)}
    @payment_methods = current_user.payment_methods
    @sub_cat = @subscriptions.group_by(&:category)


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
  end

  def analysis
    @users = current_user
    @subscriptions_all = current_user.subscriptions
    @subscriptions = current_user.subscriptions.select{|sub| sub.subs_month(Date.today)}

    @sub_cat = @subscriptions.group_by(&:category)
    @sub_app = @subscriptions.group_by(&:name)

    # This month's subscription cost per category
    @monthly_subscriptions = current_user.subscriptions
    @colors_month = []
    @pie_chart_data_this_month = []
    @monthly_subscriptions.group_by(&:category).each do |month, sub_array|
      month_value = sub_array.inject(0) {|sum, sub| sum + sub.lifelong_cost2( Date.today.beginning_of_month, Date.today.end_of_month)}
      @pie_chart_data_this_month << [month, month_value]
      @colors_month << sub_array.first.category_color[:value]
    end

    # This year's subscription cost per category
    @yearly_subscriptions = current_user.subscriptions
    @colors_year = []
    @pie_chart_data_this_year = []
    @yearly_subscriptions.group_by(&:category).each do |year, sub_array|
      year_value = sub_array.inject(0) {|sum, sub| sum + sub.lifelong_cost(Date.today.beginning_of_year, Date.today.end_of_year)}
      @pie_chart_data_this_year << [year, year_value]
      @colors_year << sub_array.first.category_color[:value]
    end

     # This year's subscription cost per app
    @yearly_subscriptions_app = current_user.subscriptions
    @pie_chart_data_per_app = []
    @yearly_subscriptions_app.each do |subs|
      year_value_app = subs.lifelong_cost(Date.today.beginning_of_year, Date.today.end_of_year)
      @pie_chart_data_per_app << [subs.name, year_value_app]
    end

    i = 0
    @chart_array = { }
    12.times do
      current_month = Date.today + i.month
      @subscription_costs = @subscriptions_all.select { |sub| sub.subs_month(current_month) }
      @monthly_cost = @subscription_costs.inject(0){ |sum, x|  sum + x.cost }.round(2)
      @monthly_name = "#{(current_month).strftime("%B")} #{current_month.year}"

      @chart_array[@monthly_name] = @monthly_cost
      i += 1
      end

    i = 0
    @line_array = {}
    5.times do
      current_year = Date.today.year - i
      yearly_cost = 0
        @subscriptions_all.each do |create|
          if create.creation_date.nil?
            origin_date = create.created_at
          else
            origin_date = create.creation_date
          end

          next if origin_date.year > current_year


          yearly_cost += create.lifelong_cost(Date.new(current_year, 1, 1) , Date.new(current_year, 12, 31))

        end

        @line_array[current_year] = yearly_cost.round(2)

      i += 1
    end

    i=0
    @line_array2 = {}
      36.times do
      current_month_y = Date.today - i.month
      yearly_cost2 = 0
        @subscriptions_all.each do |create|
          if create.creation_date.nil?
            origin_date = create.created_at
          else
            origin_date = create.creation_date
          end

          next if origin_date > current_month_y

          yearly_cost2 += create.lifelong_cost(current_month_y.beginning_of_month , current_month_y.end_of_month)
        end

        @line_array2[current_month_y.beginning_of_month] = yearly_cost2.round(2)

      i += 1
    end
  end

  def notifications
    @subscriptions = current_user.subscriptions.select { |n| n.notification_date && n.notify_today? }
  end

end
