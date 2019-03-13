class AddPhotosToPaymentMethod < ActiveRecord::Migration[5.2]
  def change
    add_column :payment_methods, :photo, :string
  end
end
