class DressmakerProfile < ApplicationRecord
  belongs_to :user

  validates :bio, presence: true, length: { minimum: 100, maximum: 500 }
end
