class RemoveAndAddReturnedColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :rentals, :returned
    add_column :rentals, :returned, :datetime
  end
end
