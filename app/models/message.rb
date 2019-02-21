class Message < ApplicationRecord
  belongs_to :users
  belongs_to :orders

  validates :content, presence: true
end
