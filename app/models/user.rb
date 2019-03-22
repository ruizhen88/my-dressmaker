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

  geocoded_by :street_address
  after_validation :geocode, if: :will_save_change_to_street_address?
  mount_uploader :photo, PhotoUploader
end
