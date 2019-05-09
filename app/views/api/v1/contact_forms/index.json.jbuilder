json.array! @contact_forms do |contact_form|
  json.extract! contact_form, :id, :visitor_id, :email
end
