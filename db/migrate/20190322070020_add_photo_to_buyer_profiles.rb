class AddPhotoToBuyerProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :buyer_profiles, :photo, :string
  end
end
