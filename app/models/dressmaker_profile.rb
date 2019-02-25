class DressmakerProfile < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :user_specialities
  has_many :specialities, through: :user_specialities
  has_many :photos

  # validates :bio, presence: true, length: { minimum: 100, maximum: 500 }

  include PgSearch
  pg_search_scope :global_search,
    associated_against: {
      user: [:first_name, :last_name],
      specialities: [:name]
    },
    using: {
      tsearch: { prefix: true }
    }
  pg_search_scope :speciality_search,
    associated_against: {
      specialities: [:name]
    },
    using: {
      tsearch: { prefix: true }
    }
  # add weight
end
