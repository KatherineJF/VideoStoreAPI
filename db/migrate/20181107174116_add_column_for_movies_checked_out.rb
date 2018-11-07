class AddColumnForMoviesCheckedOut < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :movie_checked_out_count, :integer
    add_column :movies, :available_inventory, :integer
  end
end
