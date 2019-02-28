class DressmakerProfile < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :user_specialities
  has_many :specialities, through: :user_specialities
  has_many :photos
  # after_create :send_welcome_email

  # validates :bio, presence: true, length: { minimum: 100, maximum: 500 }

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
  private

# ------ Welcome email method
  # def send_welcome_email
  #   UserMailer.welcome_dm(user).deliver_now
  # end


end
