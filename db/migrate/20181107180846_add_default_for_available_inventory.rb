class AddDefaultForAvailableInventory < ActiveRecord::Migration[5.2]
  def change
    change_column :movies, :available_inventory, :integer, default: :inventory
  end
end
