class Subscription < ApplicationRecord
  belongs_to :payment_method
  belongs_to :user
  has_many :subscription_parasites
  has_many :parasites, through: :subscription_parasites

  validates :name, presence: true
  validates :subscription_type, presence: true
  validates :cost, presence: true
  validates :billing_date, presence: true

  before_validation :set_create_date

  def set_create_date
    if self.creation_date.nil?
      self.creation_date = Date.today
    end
  end



  def lifelong_cost
    total_cost = 0
    if self.subscription_type == "Monthly"
      return calc_monthly.round(2)
    elsif self.subscription_type == "Quarterly"
      return calc_quatertly.round(2)
    elsif self.subscription_type == "Biannually"
      return calc_biannualy.round(2)
    else self.subscription_type == "Annually"
      return calc_yearly.round(2)
    end
  end

  def calc_monthly
      if self.cost.nil?
        cost = 0
      else
        cost = self.cost
      end

      date_pay = self.creation_date

      while date_pay < Date.today
          date_pay = date_pay + 1.months
          cost += self.cost
      end
      return cost
  end

  def calc_quatertly
      if self.cost.nil?
        cost = 0
      else
        cost = self.cost
      end

      date_pay = self.creation_date
      while date_pay < Date.today
          date_pay = date_pay + 3.months
          cost += self.cost
      end
      return cost
  end

    def calc_biannualy
      if self.cost.nil?
        cost = 0
      else
        cost = self.cost
      end

      date_pay = self.creation_date

      while date_pay < Date.today
          date_pay = date_pay + 6.months
          cost += self.cost
      end
      return cost
  end

  def calc_yearly
    if self.cost.nil?
      cost = 0
    else
      cost = self.cost
    end

    date_pay = self.creation_date

    while date_pay < Date.today
        date_pay = date_pay + 12.months
        cost += self.cost
    end
    return cost
  end

  def notify_today?
    notify = false
    value_date = notification_date

    until value_date >= Date.today
        if self.subscription_type == "Monthly"
          value_date = value_date + 1.month
        elsif self.subscription_type == "Quarterly"
           value_date = value_date + 3.months
        elsif self.subscription_type == "Biannually"
           value_date = value_date + 6.months
        else self.subscription_type == "Annually"
           value_date = value_date + 1.year
       end
    end
    value_date == Date.today
  end


  def subs_month(date)
    notify = false
    value_date = billing_date

    until ((date.beginning_of_month..date.end_of_month) === value_date) || (value_date > date.end_of_month )
       if self.subscription_type == "Monthly"
          value_date = value_date + 1.month
        elsif self.subscription_type == "Quarterly"
           value_date = value_date + 3.months
        elsif self.subscription_type == "Biannually"
           value_date = value_date + 6.months
        else self.subscription_type == "Annually"
           value_date = value_date + 1.year
       end
    end
    (date.beginning_of_month..date.end_of_month) === value_date
  end


  def payment_date
    payment_date = billing_date

    until payment_date > Date.today
      if self.subscription_type == "Monthly"
        payment_date = payment_date + 1.month
      elsif self.subscription_type == "Quarterly"
        payment_date = payment_date + 3.months
      elsif self.subscription_type == "Biannually"
        payment_date = payment_date + 6.months
      else self.subscription_type == "Annually"
        payment_date = payment_date + 1.year
      end
    end
    return payment_date
  end


  def category_color
    if self.category == "Media"
      'red'
    elsif self.category == "Wellbeing"
      'green'
    elsif self.category == "Streaming"
      'lightblue'
    elsif self.category == "Leisure"
      'darkblue'
    elsif self.category == "Social"
      'orange'
    elsif self.category == "Shopping"
      'pink'
    elsif self.category == "Food"
      'yellow'
    elsif self.category == "Technology"
      'gray'
    elsif self.category == "Other"
      'purple'
    end
  end
end
