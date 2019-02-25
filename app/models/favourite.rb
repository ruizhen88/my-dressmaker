class Favourite < ApplicationRecord
  belongs_to :DressmakerProfile, dependent: :destroy
  belongs_to :BuyerProfile, dependent: :destroy
end
