json.statut @statut
json.user do
  json.first_name @user.first_name
  json.last_name @user.last_name
  json.avatar @user.avatar.url(:bright_face)
  json.email @user.email
  json.phone @user.phone
end

if @user.client
  json.conseiller  do
    json.id @advisor.id
    json.first_name @advisor.first_name
    json.avatar @advisor.avatar.url(:bright_face)
    json.last_name @advisor.last_name
    json.phone @advisor.phone
  end
  json.agenda @url
  json.project @project, :id


elsif @user.advisor
  json.new_message Message.last
  json.notifications @user.notifications.order(:date) do |notification|
    json.user notification.project.his_client.first_name if notification.project.his_client.present?
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
    if client.present?
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
  end

elsif @user.admin
    json.advisors @advisors do |advisor|
      json.id advisor.id
      # json.email advisor.email
      # json.phone advisor.phone
      json.sign_in user_signed_in?
      if advisor.his_clients.present?
        json.clients advisor.his_clients do |client|
          if client.present?
            json.client client.id
            json.project client.project.id
          end
        end
      end
    end
    json.clients @clients do |client|
      json.sign_in user_signed_in?
      json.client client.id
      # json.email client.email
      # json.phone client.phone
      json.project client.project.id
    end
    json.activities do
      json.projects Project.all.count
      json.current Project.where.not(step: "archived").count
      json.requests Request.where.not(close: true).count
      json.visitors Visitor.all.count
      json.formulaires @vis_formulaires.count
      json.inscription User.clients.count
      json.connected @connected.compact.count
      json.unloged @unloged.compact.count
      json.dormant @inactifs.compact.count
    end





    json.inscrits @nbr_sign_in.count
    json.in_progress @in_progress.count
    json.archived @archived.count

    json.notifications Notification.all.order(:date) do |notification|
      json.project notification.project.id
      json.conseiller notification.project.is_his_advisor.first_name  if notification.project.is_his_advisor.present?
      json.user notification.project.his_client.first_name if notification.project.his_client.present?
      json.title notification.title
      json.time distance_of_time_in_words(notification.date, Time.now)
    end
end
