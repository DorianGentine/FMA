json.user @user, :first_name, :last_name, :avatar
json.statut @statut

if @user.client
  json.conseiller @advisor, :first_name, :last_name, :avatar, :phone

  json.project do
    json.id @project.id
    json.date_de_creation @project.created_at
    json.etape @project.step
    json.nombre_de_financer @solutions.count
    json.formulary_ids @project.formulary_ids
  end


  json.financers @solutions do |solution|
    json.id solution.id
    json.extract! solution.financer, :name, :logo, :description, :answer
    json.answers solution.answers do |answer|
      json.extract! answer, :content
    end
  end
elsif @user.advisor
  json.agenda @url
  json.notifications @user.notifications.order(:date) do |notification|
    json.user notification.project.his_client.first_name
    json.title notification.title
    json.time distance_of_time_in_words(notification.date, Time.now)
  end

  json.clients @clients do |client|
    json.extract! client, :id, :avatar, :last_name, :first_name, :phone
    json.etape client.projects.first.step
    json.financers client.projects.first.solutions do |solution|
      json.id solution.id
      json.extract! solution.financer, :name, :logo, :description, :answer
      json.answers solution.answers do |answer|
        json.extract! answer, :content
      end
    end

    json.documents client.projects.first.documents do |document|
      json.extract! document, :title, :file, :solution_ids, :formulary_ids
    end
  end
end
