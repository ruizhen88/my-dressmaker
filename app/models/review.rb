class Review < ApplicationRecord
  belongs_to :order

  validates :content, :rating, presence: true
  validates_numericality_of :rating
end
