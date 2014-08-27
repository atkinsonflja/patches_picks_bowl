json.array!(@tiebreakers) do |tiebreaker|
  json.extract! tiebreaker, :id, :user_id, :home_score, :away_score, :game_id
  json.url tiebreaker_url(tiebreaker, format: :json)
end
