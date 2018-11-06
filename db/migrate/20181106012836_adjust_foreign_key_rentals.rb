class AdjustForeignKeyRentals < ActiveRecord::Migration[5.2]

  def up
    rename_column :rentals, :customer_id, :customer_id_old
    rename_column :rentals, :movie_id, :movie_id_old
    add_reference :rentals, :customer, index:true
    add_reference :rentals, :movie, index:true
    Rental.all.each do |rental|
      rental.customer_id = Integer(rental.customer_id_old)
      rental.movie_id = Integer(rental.movie_id_old)
      rental.save!
    end
    remove_column :rentals, :customer_id_old
    remove_column :rentals, :movie_id_old
  end

  def down
    rename_column :rentals, :customer_id, :customer_id_old
    rename_column :rentals, :movie_id, :movie_id_old
    add_column :rentals, :customer_id, :string, index:true
    add_column :rentals, :movie_id, :string, index:true
    Rental.all.each do |rental|
      rental.customer_id = rental.customer_id_old.to_s
      rental.movie_id = rental.movie_id_old.to_s
      rental.save!
    end
    remove_column :rentals, :customer_id_old
    remove_column :rentals, :movie_id_old
  end
end
