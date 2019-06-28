class RessourceUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process :convert => 'pdf'

  def public_id
    return "ressources/" + Cloudinary::PreloadedFile.split_format(original_filename).first + "_-" + Cloudinary::Utils.random_public_id[0,2]
  end

end
