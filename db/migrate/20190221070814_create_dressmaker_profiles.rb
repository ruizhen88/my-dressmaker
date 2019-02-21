class CreateDressmakerProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :dressmaker_profiles do |t|
      t.string :bio
      t.string :account_status
      t.string :insta_url
      t.string :fb_url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
