class SubscriptionParasite < ApplicationRecord
  belongs_to :parasite
  belongs_to :subscription
end
