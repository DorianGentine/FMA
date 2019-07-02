json.advisors @advisors do |user|
  json.id user.id
  json.sign_in user_signed_in?
  json.first_name user.first_name
  json.last_name user.last_name
  json.email user.email
  json.avatar user.avatar
  json.phone user.phone
  json.created_at user.created_at
  json.url "/mon_espace/#{user.id}"

  json.clients user.his_clients do |client|
    if client.present?
      json.id client.id
      json.first_name client.first_name
      json.last_name client.last_name
      json.étape client.project.step
      json.rdv client.project.appointment
      json.financeurs client.project.solutions.count
      json.kits client.project.kits do |kit|
        json.id kit.id
        json.ressource kit.ressource.id
      end
    end
  end
end

