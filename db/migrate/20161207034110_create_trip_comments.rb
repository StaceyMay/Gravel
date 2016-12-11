class CreateTripComments < ActiveRecord::Migration[5.0]
  def change
    create_table :trip_comments do |t|

      t.text :comment
      t.integer :trip_id
      t.integer :user_id


      t.timestamps
    end
  end
end
