require_relative "./team_data"
require_relative "player"
# require 'pry'
class Team

  attr_reader :name
  def initialize(name)
    @name = name
  end

  def self.positions
    @positions = []
    TeamData::ROLL_CALL.each do |team, info|
      info.each do |position, name|
        # if @positions does not include position
        @positions << position
      end
    end
    return @positions
    #in app file, use this to call Team.positions
  end

  def self.all
    @team_names = []
    TeamData::ROLL_CALL.each do |team, info|
      @team_names << team
    end
    return @team_names
  end

  def self.players(team_name)
    @players = []
    TeamData::ROLL_CALL.each do |team, info|
      if team.to_s == team_name
        info.each do |position, name|
          @players << Player.new(name, position, team)
        end
      end
    end
    return @players
  end
end
