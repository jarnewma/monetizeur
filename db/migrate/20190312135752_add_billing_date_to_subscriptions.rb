class AddBillingDateToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :billing_date, :string
  end
end
