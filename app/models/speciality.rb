class Speciality < ApplicationRecord
  has_many :dressmakers, through: :user_specialities
  validates :name, presence: true
end
