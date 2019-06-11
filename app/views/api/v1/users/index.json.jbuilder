

json.clients @users do |user|
  json.id user.id
  json.first_name user.first_name
  json.last_name user.last_name
  json.avatar user.avatar
  json.phone user.phone
  json.étape user.project.step
  json.financeurs user.project.solutions.count
  json.url "/mon_espcae/#{user.id}"
end

