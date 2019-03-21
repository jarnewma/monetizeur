class Subscription < ApplicationRecord
  belongs_to :payment_method
  belongs_to :user
  has_many :subscription_parasites, dependent: :nullify
  has_many :parasites, through: :subscription_parasites, dependent: :nullify


  mount_uploader :photo, PhotoUploader
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

  def lifelong_cost(from_date: nil, to_date: nil)
    total_cost = 0
    if self.subscription_type == "Monthly"
      return calc_monthly(from_date: from_date, to_date: to_date).round(2)
    elsif self.subscription_type == "Quarterly"
      return calc_quartertly(from_date: from_date, to_date: to_date).round(2)
    elsif self.subscription_type == "Biannually"
      return calc_biannualy(from_date: from_date, to_date: to_date).round(2)
    else self.subscription_type == "Annually"
      return calc_yearly(from_date: from_date, to_date: to_date).round(2)
    end
  end

  def calc_monthly(from_date: nil, to_date: nil)
      cost = 0

      date_pay = from_date.nil? ? self.creation_date : from_date
      if date_pay < self.creation_date
        date_pay = self.creation_date
      end
      to_date = to_date.nil? ? Date.today : to_date

      while date_pay < to_date
          cost += self.cost
          date_pay = date_pay + 1.months

      end
      return cost
  end

  def calc_quartertly(from_date: nil, to_date: nil)
        cost = 0

      date_pay = from_date.nil? ? self.creation_date : from_date
        if date_pay < self.creation_date
        date_pay = self.creation_date
        end
      to_date = to_date.nil? ? Date.today : to_date

      while date_pay < to_date
          cost += self.cost
          date_pay = date_pay + 3.months

      end
      return cost
  end

    def calc_biannualy(from_date: nil, to_date: nil)
      cost = 0
      date_pay = from_date.nil? ? self.creation_date : from_date
        if date_pay < self.creation_date
        date_pay = self.creation_date
        end
      to_date = to_date.nil? ? Date.today : to_date

      while date_pay < to_date
          cost += self.cost
          date_pay = date_pay + 6.months

      end
      return cost
  end

  def calc_yearly(from_date: nil, to_date: nil)
    cost = 0
    date_pay = from_date.nil? ? self.creation_date : from_date
        if date_pay < self.creation_date
        date_pay = self.creation_date
        end
    to_date = to_date.nil? ? Date.today : to_date

    while date_pay < to_date
        cost += self.cost
        date_pay = date_pay + 12.months

    end
    return cost
  end

  def notify_today?
    notify = false
    return false if notification_date.nil? || !renewal_notification
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
    p self if self.name == "Fitness"
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
    p value_date if self.name == "Fitness"
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
      {class_name: 'red', value: 'red'}
    elsif self.category == "Wellbeing"
      {class_name:'green', value: '#5CB566'}
    elsif self.category == "Streaming"
      {class_name:'lightblue', value: 'lightblue'}
    elsif self.category == "Leisure"
      {class_name:'darkblue', value: 'darkblue'}
    elsif self.category == "Social"
      {class_name:'orange', value: 'orange'}
    elsif self.category == "Shopping"
      {class_name:'pink', value: 'pink'}
    elsif self.category == "Food"
      {class_name:'yellow', value: 'yellow'}
    elsif self.category == "Technology"
      {class_name:'gray', value: 'gray'}
    elsif self.category == "Other"
      {class_name:'purple', value: 'purple'}
    end
  end

  def this_month_billing_day
    facture_day = self.billing_date
    i = 0
    if self.subscription_type == "Monthly"
      while facture_day < Date.today.beginning_of_month
        facture_day += i.month
        i += 1
      end
    elsif self.subscription_type == "Quarterly"
      while facture_day < Date.today.beginning_of_month
      facture_day += i.month
      i += 3
      end
    elsif self.subscription_type == "Biannually"
      while facture_day < Date.today.beginning_of_month
      facture_day += i.month
      i += 6
      end
    else self.subscription_type == "Annually"
      while facture_day < Date.today.beginning_of_month
      facture_day += i.month
      i += 12
      end
    end
    return  facture_day
  end

    def previous_billing_day
    facture_day = self.billing_date
    i = 0
    if self.subscription_type == "Monthly"
      while facture_day < Date.today.beginning_of_month
        facture_day += i.month
        i += 1
      end
        facture_day -= 1.month
    elsif self.subscription_type == "Quarterly"
      while facture_day < Date.today.beginning_of_month
      facture_day += i.month
      i += 3
      end
      facture_day -= 3.month
    elsif self.subscription_type == "Biannually"
      while facture_day < Date.today.beginning_of_month
      facture_day += i.month
      i += 6
      end
      facture_day -= 6.month
    else self.subscription_type == "Annually"
      while facture_day < Date.today.beginning_of_month
      facture_day += i.month
      i += 12
      end
      facture_day -= 12.month
    end
    return  facture_day
  end

  def current_billing_day
    facture_day = self.billing_date
    i = 0
    if self.subscription_type == "Monthly"
      while facture_day < Date.today
        facture_day += i.month
        i += 1
      end
    elsif self.subscription_type == "Quarterly"
      while facture_day < Date.today
      facture_day += i.month
      i += 3
      end
    elsif self.subscription_type == "Biannually"
      while facture_day < Date.today
      facture_day += i.month
      i += 6
      end
    else self.subscription_type == "Annually"
      while facture_day < Date.today
      facture_day += i.month
      i += 12
      end
    end
    return  facture_day
  end


end
