class Subscription < ApplicationRecord
  belongs_to :payment_method
  belongs_to :user

  def lifelong_cost
    total_cost = 0
    if self.subscription_type == "Monthly"
      return calc_monthly
    elsif self.subscription_type == "Quaterly"
      return calc_quatertly
    elsif self.subscription_type == "Biannually"
      return calc_biannualy
    else self.subscription_type == "Annually"
      return calc_yearly
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


