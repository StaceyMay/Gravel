class CreateTripCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :trip_categories do |t|

      t.integer :category_id
      t.integer :trip_id

      t.timestamps
    end
  end
end
