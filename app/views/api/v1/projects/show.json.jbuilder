
json.project do
  json.id @project.id
  json.date_de_creation @project.created_at
  json.etape @project.step
  json.hint @project.hint
  json.rdv @project.appointment
  json.nombre_de_financer @project.solutions.count
  json.formulary_ids @project.formulary_ids
end

json.formularies @project.formularies do |formulary|
  json.extract! formulary, :id, :first_name
end

json.documents @project.documents do |document|
  json.extract! document, :id, :title, :description, :file, :notice, :solution_ids, :formulary_ids
end


json.financers @project.solutions do |solution|
  json.id solution.id
  json.extract! solution.financer, :name, :logo, :description, :answer
  json.answers solution.answers do |answer|
    json.extract! answer, :content
  end
end
