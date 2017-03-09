class Game < ApplicationRecord
  has_many :game_teams
  belongs_to :round
  has_one :tournament, through: :round
  has_one :admin, through: :round
  has_many :teams, through: :game_teams

  validates :position, presence: true
end
