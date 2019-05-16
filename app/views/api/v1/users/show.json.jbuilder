

json.conseiller @advisor, :first_name, :last_name, :avatar, :phone

json.project do
  json.date_de_creation @project.created_at
  json.etape @project.step
  json.nombre_de_financer @solutions.count
end

json.beneficiaire @user, :first_name, :last_name, :avatar

json.financers @solutions do |solution|
  json.extract! solution.financer, :name, :logo, :description, :answer
  json.answers solution.answers do |answer|
    json.extract! answer, :content
  end
end
