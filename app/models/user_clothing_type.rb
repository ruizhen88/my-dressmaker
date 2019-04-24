class UserClothingType < ApplicationRecord
  belongs_to :dressmaker_profile, dependent: :destroy
  belongs_to :clothing_type, dependent: :destroy
end
