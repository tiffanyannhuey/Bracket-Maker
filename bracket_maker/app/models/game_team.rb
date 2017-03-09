class GameTeam < ApplicationRecord
  belongs_to :game
  belongs_to :team

  validates_associated :game, :team

end
