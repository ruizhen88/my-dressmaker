class Photo < ApplicationRecord
  belongs_to :DressmakerProfile

  validates :url, presence: true
end
