class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.string :customer_id
      t.string :movie_id
      t.datetime :checkout
      t.datetime :due_date
      t.boolean :returned

      t.timestamps
    end
    add_index :rentals, :customer_id
    add_index :rentals, :movie_id
  end
end
