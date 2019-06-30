class ZipFile

  def initialize(project)
    @project = project
  end


  def call_ressource(ressource)
    return Cloudinary::Utils.download_zip_url(:public_ids => generate_ressource(ressource),
    :resource_type => 'image')
  end

  def call_ressources
    return Cloudinary::Utils.download_zip_url(:public_ids => generate_ressources,
    :resource_type => 'image')
  end

  private

  def generate_ressource(ressource)
    array = []
    if ressource.model_1?
      model_1 = ressource.model_1_identifier.split("ressources").last.gsub(".pdf", "")
      array << "ressources" + model_1
    end
    if ressource.model_2?
      model_2 = ressource.model_2_identifier.split("ressources").last.gsub(".pdf", "")
      array << "ressources" + model_2
    end
    if ressource.notice?
      notice = ressource.notice_identifier.split("ressources").last.gsub(".pdf", "")
      array << "ressources" + notice
    end
    if ressource.formulary?
      formulary = ressource.formulary_identifier.split("ressources").last.gsub(".pdf", "")
      array << "ressources" + formulary
    end
    return array
  end

  def generate_ressources
    array = []
    @project.ressources.each do |ressource|
      generate_ressource(ressource).each { |e| array << e  }
    end
    return array
  end

end
