class Subscription < ApplicationRecord
  belongs_to :payment_method
  belongs_to :user
  has_many :subscription_parasites
  has_many :parasites, through: :subscription_parasites

  def lifelong_cost
    total_cost = 0
    if self.subscription_type == "Monthly"
      return calc_monthly.round(2)
    elsif self.subscription_type == "Quaterly"
      return calc_quatertly.round(2)
    elsif self.subscription_type == "Biannually"
      return calc_biannualy.round(2)
    else self.subscription_type == "Annually"
      return calc_yearly.round(2)
    end
  end

  def calc_monthly
      cost = self.cost
      date_pay = self.creation_date

      while date_pay < Date.today
          date_pay = date_pay + 1.months
          cost += self.cost
      end
      return cost
  end

  def calc_quatertly
      cost = self.cost
      date_pay = self.creation_date

      while date_pay < Date.today
          date_pay = date_pay + 3.months
          cost += self.cost
      end
      return cost
  end

    def calc_biannualy
      cost = self.cost
      date_pay = self.creation_date

      while date_pay < Date.today
          date_pay = date_pay + 6.months
          cost += self.cost
      end
      return cost
  end

  def notify_today
    notify = false
    value_date = notification_date

    until value_date > Date.today
        if self.subscription_type == "Monthly"
          value_date = value_date + 1.month
        elsif self.subscription_type == "Quaterly"
           value_date = value_date + 3.months
        elsif self.subscription_type == "Biannually"
           value_date = value_date + 6.months
        else self.subscription_type == "Annually"
           value_date = value_date + 1.year
       end
        notify = true if value_date == Date.today
    end
    notify
  end

  def payment_date
    payment_date = billing_date

    until payment_date > Date.today
        if self.subscription_type == "Monthly"
          payment_date = payment_date + 1.month
        elsif self.subscription_type == "Quaterly"
           payment_date = payment_date + 3.months
        elsif self.subscription_type == "Biannually"
           payment_date = payment_date + 6.months
        else self.subscription_type == "Annually"
           payment_date = payment_date + 1.year
       end
        return payment_date
    end
  end

    def calc_yearly
      cost = self.cost
      date_pay = self.creation_date

      while date_pay < Date.today
          date_pay = date_pay + 12.months
          cost += self.cost
      end
      return cost
  end
end

