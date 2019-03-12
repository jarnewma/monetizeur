class AddUserReferencesToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_reference :subscriptions, :user, foreign_key: true
  end
end
