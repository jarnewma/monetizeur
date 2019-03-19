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

  def growth_subscription
    percentage = (((self.total_monthly_cost - self.total_monthly_cost_last_month)/self.total_monthly_cost_last_month)*100).round(2)
  end

end
