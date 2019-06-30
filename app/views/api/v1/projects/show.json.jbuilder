
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
  json.author  do
    json.id @project.is_his_advisor.id
    json.name @project.is_his_advisor.name
    json.avatar @project.is_his_advisor.avatar.url(:bright_face)
  end
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
if @project.kits.count > 0
  json.kits @project.kits do |kit|
    json.id kit.id
    json.ressource kit.ressource.id
    json.extract! kit.ressource, :id, :title, :description, :updated_at, :notice, :formulary, :model_1, :model_2
  end
end


json.financers @project.solutions do |solution|
  json.id solution.id
  json.extract! solution.financer, :name, :logo, :unmatched, :web, :phone, :description, :answer

  json.answers solution.answers do |answer|
    json.extract! answer, :content
  end
end
