class Order < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_one :review
  belongs_to :dressmaker, class_name: "User", dependent: :destroy
  has_many :messages

  validates :price, :completion_date, :order_details, :status, presence: true
  validates :order_reference, uniqueness: true
  validates_numericality_of :price

  monetize :price_cents
end
