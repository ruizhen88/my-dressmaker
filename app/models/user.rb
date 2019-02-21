class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :buyer_profile
  has_one :dressmaker_profile
  has_many :messages
  has_many :orders
  has_many :purchase_orders, foreign_key: "dressmaker_id", class_name: "Order"
end
