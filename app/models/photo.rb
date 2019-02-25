class Photo < ApplicationRecord
  belongs_to :dressmaker_profile, dependent: :destroy
  mount_uploader :url, PhotoUploader

  validates :url, presence: true
end
