require_relative "./team_data"
require_relative "team"

class Player

  attr_reader :name, :position, :team_name

  def initialize(name, position, team_name)
    @name = name
    @position = position
    @team_name = team_name
  end

  def self.all
    @player_array = []
    TeamData::ROLL_CALL.each do |team, players|
      players.each do |position, name|
        @player_array << new(name,position,team)
      end
    end
    return @player_array
  end

  def self.player_by_position(position_name)
    @players = []
    TeamData::ROLL_CALL.each do |team, info|
      info.each do |position, name|
        if position.to_s == position_name
          @players << new(name, position, team)
        end
      end
    end
    return @players
  end
end
