class AddSlugToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :slug, :string
    add_index :trips, :slug
  end
end
