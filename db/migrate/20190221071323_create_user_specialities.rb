class CreateUserSpecialities < ActiveRecord::Migration[5.2]
  def change
    create_table :user_specialities do |t|
      t.references :dressmaker_profile, foreign_key: true
      t.references :speciality, foreign_key: true

      t.timestamps
    end
  end
end
