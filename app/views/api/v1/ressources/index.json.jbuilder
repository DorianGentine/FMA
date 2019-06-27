json.array! @ressources.each do |ressource|
  json.extract! ressource, :id, :title, :description, :notice, :formulary, :model_1, :model_2
end
