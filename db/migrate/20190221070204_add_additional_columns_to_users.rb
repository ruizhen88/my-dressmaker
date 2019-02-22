class AddAdditionalColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :dressmaker, :boolean
    add_column :users, :street_address, :string
    add_column :users, :street_address_2, :string
    add_column :users, :country, :string
    add_column :users, :post_code, :string
    add_column :users, :avatar_url, :string
  end
end
