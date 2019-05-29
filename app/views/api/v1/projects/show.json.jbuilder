
json.documents @project.documents do |document|
  json.extract! document, :id, :title, :description, :file, :notice, :solution_ids, :formulary_ids
end
