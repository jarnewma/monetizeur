class Parasite < ApplicationRecord
  belongs_to :user
  has_many :subscription_parasites
  has_many :subscriptions, through: :subscription_parasites
end
