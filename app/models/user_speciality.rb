class UserSpeciality < ApplicationRecord
  belongs_to :DressmakerProfile
  belongs_to :Speciality
end
