class Review < ApplicationRecord
  belongs_to :order, dependent: :destroy

  validates :content, :rating, presence: true
  validates_numericality_of :rating
end
