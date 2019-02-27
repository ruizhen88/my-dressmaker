class Message < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :order, dependent: :destroy

  validates :content, presence: true
end
