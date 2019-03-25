class AvatarUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  # version :face do
  #   cloudinary_transformation width: 150, height: 150, crop: :thumb, gravity: :face
  # end
end
