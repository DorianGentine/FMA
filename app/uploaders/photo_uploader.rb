class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :bright_face do
    cloudinary_transformation effect: "brightness:30",
      width: 150, height: 150, crop: :thumb, gravity: :face
  end

  def public_id
    forlder = "#{ model.last_name }_#{ model.first_name }"
    return "projects/#{forlder}/" + Cloudinary::PreloadedFile.split_format(original_filename).first + "_-" + Cloudinary::Utils.random_public_id[0,2]
  end

end
