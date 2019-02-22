class Photo < ApplicationRecord
  belongs_to :dressmaker_profile

  validates :url, presence: true
end
