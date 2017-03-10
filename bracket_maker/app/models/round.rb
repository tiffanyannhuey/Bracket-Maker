class Round < ApplicationRecord
  belongs_to :tournament
  has_one :admin, through: :tournament
  has_many :games, ->{ order(:position) }
  has_many :game_teams, through: :games
  has_many :teams, through: :games

  # after_update :advance_lonely_player

  validates :number, presence: true

  # validates_associated :games, :teams, :tournament

  validates_presence_of :admin

  # def advance_lonely_player
  #   self.games.find { |game| game.teams.count == 1 }.game_teams.first.advance_player
  # end
end
