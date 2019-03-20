class PaymentMethod < ApplicationRecord
  belongs_to :user
  has_many :subscriptions, dependent: :nullify

  mount_uploader :photo, PhotoUploader

end
