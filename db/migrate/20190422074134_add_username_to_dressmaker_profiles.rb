class AddUsernameToDressmakerProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :dressmaker_profiles, :username, :string
  end
end
