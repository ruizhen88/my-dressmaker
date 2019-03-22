class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :buyer_profiles, :photo, :avatar
    rename_column :dressmaker_profiles, :photo, :avatar
  end
end
