if @project.kits.count > 0
  json.kits @project.kits do |kit|
    json.id kit.id
    json.ressource kit.ressource.id
    json.extract! kit.ressource, :id, :notice, :formulary, :model_1, :model_2

    json.download_ressource ZipFile.new(@project).call_ressource(kit.ressource)
  end
  json.download_all_ressources ZipFile.new(@project).call_ressources
end
