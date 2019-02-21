class BuyerProfile < ApplicationRecord
  belongs_to :user

  validates :size, :style, presence: true
end
