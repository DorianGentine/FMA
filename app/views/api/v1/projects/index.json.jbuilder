json.solutions @projects do |project|
  json.extract! project, :id
  json.date_de_creation project.created_at
  json.etape project.step
  json.nombre_de_bene project.formulary_ids.count  if project.formulary_ids.present?
  json.nombre_de_financer project.solutions.count  if project.solutions.present?
  json.first_name project.his_client.first_name if project.his_client.present?
  json.last_name project.his_client.last_name if project.his_client.present?
  json.demandes project.requests do |request|
    if project.is_his_advisor.present?
      json.author  do
        json.id project.is_his_advisor.id
        json.name project.is_his_advisor.name
        json.avatar project.is_his_advisor.avatar.url(:bright_face)
      end
    end
    json.extract! request, :category, :description, :close, :created_at, :id
  end
  json.notes project.notes do |note|
    json.extract! note, :title, :description, :created_at, :id
  end
  json.financers project.solutions do |solution|
    json.id solution.id
    json.extract! solution.financer, :name, :logo, :description, :answer
    json.answers solution.answers do |answer|
      json.extract! answer, :content
    end
  end
end
