class Photo < ApplicationRecord
  belongs_to :dressmaker_profile
  mount_uploader :url, PhotoUploader

  validates :url, presence: true
end
