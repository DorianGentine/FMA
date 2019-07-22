class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :bright_face do
    cloudinary_transformation effect: "brightness:30", secure: true, zoom: 0.8,
      width: 200, height: 200, crop: :thumb, gravity: :face
  end

  def public_id
    forlder = "#{ model.last_name }_#{ model.first_name }"
    return "projects/#{forlder}/" + Cloudinary::PreloadedFile.split_format(original_filename).first + "_-" + Cloudinary::Utils.random_public_id[0,2]
  end

end
