class RenameMovieCheckoutOutColumnForCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :movie_checked_out_count, :movies_checked_out_count
  end

end
