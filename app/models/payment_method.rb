class PaymentMethod < ApplicationRecord
  belongs_to :user
  has_many :subscriptions

  mount_uploader :photo, PhotoUploader

end
