class CreatePaymentMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_methods do |t|
      t.string :type
      t.string :card_nickname
      t.string :bank
      t.date :expiry_date
      t.boolean :expiry_notification

      t.timestamps
    end
  end
end
