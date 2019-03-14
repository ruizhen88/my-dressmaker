class ChangeBioToBeTextInDressmakerProfiles < ActiveRecord::Migration[5.2]
  def change
    change_column :dressmaker_profiles, :bio, :text
  end
end
