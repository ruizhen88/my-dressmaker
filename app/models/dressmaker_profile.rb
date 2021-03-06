class DressmakerProfile < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :user_specialities
  has_many :specialities, through: :user_specialities
  has_many :user_clothing_types
  has_many :clothing_types, through: :user_clothing_types
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :clothing_types
  mount_uploader :avatar, AvatarUploader
  # after_create :send_welcome_email
  # validates :bio, presence: true, length: { minimum: 100, maximum: 500 }
  # validates :avatar, presence: true

  include PgSearch
  pg_search_scope :global_search,
    associated_against: {
      user: [:first_name, :last_name, :street_address],
      specialities: [:name]
    },
    using: {
      tsearch: { prefix: true }
    }
  # add weight

  # ------ Welcome email method
  # private
  # def send_welcome_email
  #   UserMailer.welcome_dm(user).deliver_now
  # end
end
