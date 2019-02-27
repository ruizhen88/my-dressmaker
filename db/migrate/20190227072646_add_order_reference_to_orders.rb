class AddOrderReferenceToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :order_reference, :string
  end
end
