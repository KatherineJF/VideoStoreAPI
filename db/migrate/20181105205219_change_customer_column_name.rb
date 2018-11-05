class ChangeCustomerColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :registered, :registered_at
  end
end
