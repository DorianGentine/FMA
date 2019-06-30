class ZipFile

  def initialize(model, folder, format)
    @model = model
    @folder = folder
    @format = format
  end



  def call
    return Cloudinary::Utils.download_zip_url(:public_ids => generate_files)
  end


  private

  def generate_files
     @model.each do |d|
     if d.file?
       file = d.file_identifier.split("projects").last.gsub(".pdf", "")
       array << "projects" + file
     end
   end
  end

end
