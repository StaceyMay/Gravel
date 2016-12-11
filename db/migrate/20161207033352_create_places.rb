class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|

      t.string :address
      t.string :phone
      t.string :name
      t.integer :trip_id

      t.timestamps
    end
  end
end
