class RemovePortfoliosFromDressmakerProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :dressmaker_profiles, :portfolios, :json
  end
end
