require "sinatra"
require_relative "models/player"
require_relative "models/team"
require_relative "models/team_data"

set :bind, '0.0.0.0'  # bind to all interfaces

get "/" do
  "<h1>The LACKP Homepage<h1>"
  redirect "/teams"
end

get "/teams" do
  @teams = Team.all
  @players = Player.all
  erb :teams
end

get "/teams/:team_name" do
  @players = Team.players(params[:team_name])
  erb :team
end

get "/players" do
  @players = Player.all
  erb :player
end

get "/positions/" do
  @players = Player.all
  erb :position
end

get "/positions/:position_name" do
  @players = Player.all
  @position = @players.player_by_position
  erb :player_pos
end
