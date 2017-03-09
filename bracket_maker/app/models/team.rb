class Team < ApplicationRecord
  has_many :game_teams
  has_many :games, through: :game_teams
  belongs_to :tournament
end
