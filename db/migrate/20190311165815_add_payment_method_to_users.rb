class AddPaymentMethodToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :payment_methods, :user

  end
end
