class ChangeCostFromIntegerToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :subscriptions, :cost, :float
  end
end
