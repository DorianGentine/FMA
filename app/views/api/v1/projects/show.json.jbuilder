
json.documents @project.documents do |document|
  json.extract! document, :title, :description, :file, :notice
end
