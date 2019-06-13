json.statut @statut
json.user @user, :first_name, :last_name, :avatar


if @user.client
  json.conseiller @advisor, :id, :first_name, :last_name, :avatar, :phone
  json.agenda @url
  json.project @project, :id



elsif @user.advisor
  json.notifications @user.notifications.order(:date) do |notification|
    json.user notification.project.his_client.first_name
    json.title notification.title
    json.time distance_of_time_in_words(notification.date, Time.now)
  end
  json.frameworks @user.frameworks do |framework|
    json.url framework.url
    json.logo framework.logo
    json.title framework.title
  end
  json.clients @clients do |client|
    json.client client.id
    json.project client.project.id
    json.inscription client.created_at
    json.notes client.project.notes do |note|
      json.title note.title
      json.description note.description
    end
  end
end
