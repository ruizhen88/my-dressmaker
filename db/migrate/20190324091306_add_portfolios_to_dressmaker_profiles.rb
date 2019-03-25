class AddPortfoliosToDressmakerProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :dressmaker_profiles, :portfolios, :json
  end
end
