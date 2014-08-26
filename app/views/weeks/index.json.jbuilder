json.array!(@weeks) do |week|
  json.extract! week, :id, :number, :status, :winner, :previous_week_id
  json.url week_url(week, format: :json)
end
