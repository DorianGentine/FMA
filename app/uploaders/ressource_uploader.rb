class RessourceUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process :convert => 'pdf'

  version :ssl_url do
    cloudinary_transformation secure: true
  end

  def public_id
    return "ressources/" + Cloudinary::PreloadedFile.split_format(original_filename).first + "_-" + Cloudinary::Utils.random_public_id[0,2]
  end

end
