class FileUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process :convert => 'pdf'



  def public_id
    forlder = "#{ model.project.his_client.last_name }_#{ model.project.his_client.first_name }"
    return "projects/#{forlder}/" + Cloudinary::PreloadedFile.split_format(original_filename).first + "_-" + Cloudinary::Utils.random_public_id[0,2]
  end


end
