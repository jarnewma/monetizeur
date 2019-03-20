class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :payment_methods, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :subscriptions
  has_many :parasites


  def total_monthly_cost
    current_month = Date.today
    subscriptions_all = self.subscriptions
    subscriptions = self.subscriptions.select{|sub| sub.subs_month(Date.today)}
    @subscription_costs = subscriptions_all.select { |sub| sub.subs_month(current_month) }
    @monthly_cost = @subscription_costs.inject(0){ |sum, x|  sum + x.cost }.round(2)
    return @monthly_cost
  end

  def total_monthly_cost_last_month
    current_month = Date.today - 1.month
    subscriptions_all = self.subscriptions
    subscriptions = self.subscriptions.select{|sub| sub.subs_month(Date.today)}
    @subscription_costs = subscriptions_all.select { |sub| sub.subs_month(current_month) }
    @monthly_cost = @subscription_costs.inject(0){ |sum, x|  sum + x.cost }.round(2)
    return @monthly_cost
  end

  def total_monthly_cost_next_month
    current_month = Date.today + 1.month
    subscriptions_all = self.subscriptions
    subscriptions = self.subscriptions.select{|sub| sub.subs_month(Date.today)}
    @subscription_costs = subscriptions_all.select { |sub| sub.subs_month(current_month) }
    @monthly_cost = @subscription_costs.inject(0){ |sum, x|  sum + x.cost }.round(2)
    return @monthly_cost
  end

  def total_monthly_cost_last_year
    current_month = Date.today - 12.month
    subscriptions_all = self.subscriptions
    subscriptions = self.subscriptions.select{|sub| sub.subs_month(Date.today)}
    @subscription_costs = subscriptions_all.select { |sub| sub.subs_month(current_month) }
    @monthly_cost = @subscription_costs.inject(0){ |sum, x|  sum + x.cost }.round(2)
    return @monthly_cost
  end


  def growth_subscription
    if self.total_monthly_cost_last_month > 0
    percentage = (((self.total_monthly_cost - self.total_monthly_cost_last_month)/self.total_monthly_cost_last_month)*100).round(2)
    else
      100
    end
  end

  def growth_subscription_to_month
    if self.total_monthly_cost_last_year> 0
    percentage = (((self.total_monthly_cost - self.total_monthly_cost_last_year)/self.total_monthly_cost_last_year)*100).round(2)
    else
      100
    end
  end

  def ytd_spending
    total_cost = 0
    self.subscriptions.each do |sub|
      cost_sub = sub.lifelong_cost(from_date: Date.today - 1.year, to_date: Date.today)
      total_cost += cost_sub
    end
    return total_cost
  end

  def most_expensive
    yearly_subscriptions = self.subscriptions
    array_expensive = []
    array_expensive_name = []
    yearly_subscriptions.each do |subs|
      year_value = subs.lifelong_cost(from_date: Time.current - 1.year, to_date: Date.today)

      array_expensive_name << [subs.name, year_value]
    end
    max = array_expensive.max
    return  array_expensive_name.max_by {|sub| sub[1]}

  end

  def most_expensive_category
    yearly_subscriptions = self.subscriptions
    array_expensive = []
    yearly_subscriptions.group_by(&:category).each do |year, sub_array|
      year_value = sub_array.inject(0) {|sum, sub| sum + sub.lifelong_cost(from_date: Time.current - 1.year, to_date: Date.today)}
      array_expensive << [year, year_value]
    end
    return  array_expensive.max_by {|sub| sub[1]}
  end

  def parasites_count
    parasites = self.parasites
    count_array = []
    parasites.each do |par|
      count = par.subscriptions.count
      count_array << [par.name, count]
    end
    return count_array.max_by{|sub| sub[1]}
  end

  def parasite_app_name
    name_parasite = self.parasites_count[0]

  end

end
