class FileUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process :convert => 'pdf'

  def public_id
    forlder = "beneficiaire_#{ model.project.his_client.id }"
    return "projects/#{forlder}/" + Cloudinary::PreloadedFile.split_format(original_filename).first + "_-" + Cloudinary::Utils.random_public_id[0,2]
  end

end
