class AddPhotoToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :photo, :string
  end
end
