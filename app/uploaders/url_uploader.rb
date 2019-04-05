class UrlUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
