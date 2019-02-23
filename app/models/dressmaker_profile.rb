class DressmakerProfile < ApplicationRecord
  belongs_to :user
  has_many :specialities, through: :user_specialities
  # validates :bio, presence: true, length: { minimum: 100, maximum: 500 }

end
