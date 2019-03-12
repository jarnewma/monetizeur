class PaymentMethod < ApplicationRecord
  belongs_to :user
  has_many :subscriptions
end
