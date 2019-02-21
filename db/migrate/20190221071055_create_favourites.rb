class CreateFavourites < ActiveRecord::Migration[5.2]
  def change
    create_table :favourites do |t|
      t.references :dressmaker_profile, foreign_key: true
      t.references :buyer_profile, foreign_key: true

      t.timestamps
    end
  end
end
