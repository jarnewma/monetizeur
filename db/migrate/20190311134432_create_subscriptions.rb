class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.date :subscription_type
      t.integer :cost
      t.date :creation_date
      t.string :category
      t.boolean :renewal_notification
      t.date :notification_date
      t.references :payment_method, foreign_key: true

      t.timestamps
    end
  end
end
