json.financers @financers do |financer|
  json.extract! financer, :id, :name, :description, :logo
end
