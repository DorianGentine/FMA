json.array! @ressources.each do |ressource|
  json.extract! ressource, :id, :title, :description
  json.notice ressource.notice.url(:ssl_url)
  json.formulary ressource.formulary.url(:ssl_url)
  json.model_1 ressource.model_1.url(:ssl_url)
  json.model_2 ressource.model_2.url(:ssl_url)
end




