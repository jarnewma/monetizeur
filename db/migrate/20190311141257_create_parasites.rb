class CreateParasites < ActiveRecord::Migration[5.2]
  def change
    create_table :parasites do |t|
      t.string :name
      t.string :parasite_email
      t.boolean :notify_parasite
      t.references :user

      t.timestamps
    end
  end
end
