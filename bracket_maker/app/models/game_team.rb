class GameTeam < ApplicationRecord
  belongs_to :game
  belongs_to :team
  has_one :round, through: :game
  has_one :tournament, through: :game

  # validates_associated :game, :team
end
