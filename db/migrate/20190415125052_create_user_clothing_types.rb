class CreateUserClothingTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :user_clothing_types do |t|
      t.references :dressmaker_profile, foreign_key: true
      t.references :clothing_type, foreign_key: true

      t.timestamps
    end
  end
end
