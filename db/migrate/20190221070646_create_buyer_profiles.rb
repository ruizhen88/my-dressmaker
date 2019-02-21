class CreateBuyerProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :buyer_profiles do |t|
      t.integer :size
      t.string :style
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
