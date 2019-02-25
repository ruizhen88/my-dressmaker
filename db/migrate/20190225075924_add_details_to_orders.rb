class AddDetailsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :dimension_chest, :float
    add_column :orders, :dimension_waist, :float
    add_column :orders, :dimension_hips, :float
    add_column :orders, :dimension_length, :float
    add_column :orders, :colour, :string
    add_column :orders, :fabric, :string
  end
end
