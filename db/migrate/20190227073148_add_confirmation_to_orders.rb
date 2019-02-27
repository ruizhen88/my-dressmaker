class AddConfirmationToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :buyer_confirmation, :boolean
    add_column :orders, :dressmaker_confirmation, :boolean
  end
end
