class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|

      t.integer :place_id
      t.integer :user_id
      t.integer :amount
      t.text :description

      t.timestamps
    end
  end
end
