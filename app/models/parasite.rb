class Parasite < ApplicationRecord
  belongs_to :user
  has_many :subscription_parasites, dependent: :destroy
  has_many :subscriptions, through: :subscription_parasites
end
