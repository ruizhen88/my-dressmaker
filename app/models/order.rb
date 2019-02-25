class Order < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :dressmaker, class_name: "User", dependent: :destroy

  validates :cost, :completion_date, :quantity, :order_details, :status, presence: true
  validates_numericality_of :cost, :quantity
end
