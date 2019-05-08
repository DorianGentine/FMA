json.array! @formularies do |formulary|
  json.extract! formulary, :id, :first_name, :age
end
