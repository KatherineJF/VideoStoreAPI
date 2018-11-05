class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.datetime :registered
      t.integer :postal_code
      t.string :phone

      t.timestamps
    end
  end
end
