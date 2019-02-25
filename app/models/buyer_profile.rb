class BuyerProfile < ApplicationRecord
  belongs_to :user, dependent: :destroy

  # validates :size, :style, presence: true
end
