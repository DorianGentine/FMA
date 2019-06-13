

json.clients @users do |user|
  json.id user.id
  # json.project user.project.id
  json.first_name user.first_name
  # json.nombre_benef user.project.formularies.count
  json.last_name user.last_name
  json.avatar user.avatar
  # json.phone user.phone
  # json.created_at user.created_at
  # json.étape user.project.step
  # json.rdv user.project.appointment
  # json.financeurs user.project.solutions.count
  # json.kits user.project.kits do |kit|
  #   json.id kit.id
  #   json.ressource kit.ressource.id
  # end
  json.url "/mon_espcae/#{user.id}"
end

