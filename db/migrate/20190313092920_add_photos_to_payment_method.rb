class AddPhotosToPaymentMethod < ActiveRecord::Migration[5.2]
  def change
    add_column :payment_method, :photos, :binary, :limit => 10.megabyte
  end
end
