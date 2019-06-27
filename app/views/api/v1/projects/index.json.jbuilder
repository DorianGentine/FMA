json.solutions @projects do |project|
  json.extract! project, :id
  json.nombre_de_bene project.formulary_ids.count
  json.nombre_de_financer project.solutions.count
  json.first_name project.user_projects.where(client: true).first.user.first_name
  json.last_name project.user_projects.where(client: true).first.user.last_name
  json.financers project.solutions do |solution|
    json.id solution.id
    json.extract! solution.financer, :name, :logo, :description, :answer
    json.answers solution.answers do |answer|
      json.extract! answer, :content
    end
  end
end
