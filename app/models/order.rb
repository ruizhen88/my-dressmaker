class Order < ApplicationRecord
  belongs_to :user
  belongs_to :dressmaker, class_name: "User"
end
