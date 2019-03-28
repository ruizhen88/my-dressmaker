class Photo < ApplicationRecord
  belongs_to :dressmaker_profile, dependent: :destroy

  mount_uploader :url, UrlUploader

  # validates :url, presence: true
end
