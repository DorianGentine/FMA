
json.project do
  json.id @project.id
  json.date_de_creation @project.created_at
  json.etape @project.step
  json.hint @project.hint
  json.rdv @project.appointment
  json.nombre_de_financer @project.solutions.count
  json.formulary_ids @project.formulary_ids
end
json.demandes @project.requests do |request|
  json.author @project.is_his_advisor, :id, :name, :avatar
  json.extract! request, :category, :description, :category, :close, :created_at, :id
end

json.notes @project.notes do |note|
  json.extract! note, :title, :description, :created_at, :id
end


json.formularies @project.formularies do |formulary|
  json.extract! formulary, :id, :first_name
end

json.documents @project.documents do |document|
  json.extract! document, :id, :title, :description, :file, :notice, :solution_ids, :formulary_ids
end

json.kits @project.kits do |kit|
  json.id kit.id
  json.ressource kit.ressource.id
  json.extract! kit.ressource, :id, :notice, :formulary, :model_1, :model_2
  json.download_ressource ZipFile.new(@project).call_ressource(kit.ressource)
end
json.download_all_ressources ZipFile.new(@project).call_ressources if @project.kits.count > 0

json.financers @project.solutions do |solution|
  json.id solution.id
  json.extract! solution.financer, :name, :logo, :unmatched, :web, :phone, :description, :answer

  json.answers solution.answers do |answer|
    json.extract! answer, :content
  end
end
