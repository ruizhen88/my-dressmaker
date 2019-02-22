class UserSpeciality < ApplicationRecord
  belongs_to :dressmaker_profile
  belongs_to :speciality
end
