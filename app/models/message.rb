class Message < ApplicationRecord
  belongs_to :users, dependent: :destroy
  belongs_to :orders, dependent: :destroy

  validates :content, presence: true
end
