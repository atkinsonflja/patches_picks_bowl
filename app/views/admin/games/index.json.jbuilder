json.array!(@games) do |game|
  json.extract! game, :id, :week_id, :home_team_id, :home_team_ttalk, :away_team_id, :away_team_ttalk, :order
  json.url admin_game_url(game, format: :json)
end
