class CreatePlaceComments < ActiveRecord::Migration[5.0]
  def change
    create_table :place_comments do |t|

      t.text :comment
      t.integer :place_id
      t.integer :user_id

      t.timestamps
    end
  end
end
