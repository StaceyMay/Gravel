class UserTripAdmin < ActiveRecord::Migration[5.0]
  def change
    add_column :user_trips, :admin, :boolean
  end
end
