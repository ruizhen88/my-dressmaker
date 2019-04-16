class ClothingType < ApplicationRecord
  has_many :user_clothing_types
  has_many :dressmaker_profiles, through: :user_clothing_types
  # validates :name, presence: true
end
