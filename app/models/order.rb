class Order < ApplicationRecord
  belongs_to :user
  belongs_to :dressmaker, class_name: "User"

  validates :cost, :completion_date, :quantity, :order_details, :status, presence: true
  validates_numericality_of :cost, :quality
end
