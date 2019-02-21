class Favourite < ApplicationRecord
  belongs_to :DressmakerProfile
  belongs_to :BuyerProfile
end
