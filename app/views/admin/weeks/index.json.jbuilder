json.array!(@weeks) do |week|
  json.extract! week, :id
  json.url admin_week_url(week, format: :json)
end
