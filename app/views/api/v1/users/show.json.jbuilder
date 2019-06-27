json.statut @statut
json.user @user, :first_name, :last_name, :avatar, :email, :phone


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
  json.nbr_clients @clients.count
  json.nbr_kits @nbr_kits.count
  json.clients @clients do |client|
    json.client client.id
    json.email client.email
    json.phone client.phone
    json.project client.project.id
    json.inscription client.created_at
    json.notes client.project.notes do |note|
      json.title note.title
      json.description note.description
    end
  end

elsif @user.admin
    json.advisors @advisors do |advisor|
      json.id advisor.id
      json.email advisor.email
      json.phone client.phone
      json.sign_in user_signed_in?
      json.clients advisor.his_clients do |client|
        json.client client.id
        json.project client.project.id
      end
    end
    json.clients @clients do |client|
      json.sign_in user_signed_in?
      json.client client.id
      json.email client.email
      json.phone client.phone
      json.project client.project.id
    end
    json.inscrits @nbr_sign_in.count
    json.in_progress @in_progress.count
    json.archived @archived.count
end
