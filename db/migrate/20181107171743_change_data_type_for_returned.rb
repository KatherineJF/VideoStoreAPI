class ChangeDataTypeForReturned < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :rentals, :returned, :datetime
    end

    def down
      change_column :rentals, :returned, :boolean
    end
  end
end
