json.array! @visitors do |visitor|
  json.extract! visitor, :id, :user_ip
end
