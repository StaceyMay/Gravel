class AddPasswordtoTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :password, :string
  end
end
