class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :cost
      t.date :completion_date
      t.integer :quantity
      t.string :order_details
      t.string :status
      t.jsonb :payment
      t.references :user, foreign_key: true
      t.references :dressmaker, references: :user, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
