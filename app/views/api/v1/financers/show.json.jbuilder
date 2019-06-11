json.financer do
  json.id @financer.id
  json.name @financer.name
  json.logo @financer.logo
  json.description @financer.description
  json.answer @financer.answer

  json.solutions @financer.solutions do |solution|
    json.id solution.id
    json.answers solution.answers do |answer|
      json.extract! answer, :content
    end
  end


end
