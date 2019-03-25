class AddPhotoToDressmakerProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :dressmaker_profiles, :photo, :string
  end
end
