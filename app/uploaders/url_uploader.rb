class UrlUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process resize_to_fill: [243, 243, 'Center']
end
