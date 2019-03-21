class AddTrialDateUntilToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :trial_date_until, :date
  end
end
