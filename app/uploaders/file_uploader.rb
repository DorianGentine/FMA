class FileUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave


  def extension_white_list
    %w(pdf)
  end

end
