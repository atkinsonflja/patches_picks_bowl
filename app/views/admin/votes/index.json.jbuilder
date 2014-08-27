json.array!(@votes) do |vote|
  json.extract! vote, :id, :user_id, :game_id, :pick
  json.url vote_url(vote, format: :json)
end
