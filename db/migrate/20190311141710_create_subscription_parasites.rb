class CreateSubscriptionParasites < ActiveRecord::Migration[5.2]
  def change
    create_table :subscription_parasites do |t|
      t.references :parasite, foreign_key: true
      t.references :subscription, foreign_key: true

      t.timestamps
    end
  end
end
