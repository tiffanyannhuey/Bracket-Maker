class Game < ApplicationRecord
  has_many :game_teams
  belongs_to :round
  has_many :teams, through: :game_teams

  validates :tournament_id, :position, presence: true
end
