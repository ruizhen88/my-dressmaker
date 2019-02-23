class Speciality < ApplicationRecord
  has_many :user_specialities
  has_many :dressmaker_profiles, through: :user_specialities
  validates :name, presence: true
end
