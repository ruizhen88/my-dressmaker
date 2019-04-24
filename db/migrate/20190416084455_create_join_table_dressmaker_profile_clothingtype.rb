class CreateJoinTableDressmakerProfileClothingtype < ActiveRecord::Migration[5.2]
  def change
    create_join_table :dressmaker_profiles, :clothing_types do |t|
      # t.index [:dressmaker_profile_id, :clothing_type_id]
      # t.index [:clothing_type_id, :dressmaker_profile_id]
    end
  end
end
