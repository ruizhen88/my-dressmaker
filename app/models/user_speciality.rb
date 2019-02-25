class UserSpeciality < ApplicationRecord
  belongs_to :dressmaker_profile, dependent: :destroy
  belongs_to :speciality, dependent: :destroy
end
