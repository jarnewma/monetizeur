class AddBillingDateToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :billing_date, :date
  end
end
