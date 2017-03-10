class GameTeam < ApplicationRecord
  belongs_to :game
  belongs_to :team
  has_one :round, through: :game
  has_one :tournament, through: :game

  after_update :advance_player

  def next_round_position
    current_position = self.game.position
    if current_position.odd?
      return next_round = (current_position + 1) / 2
    else
      return next_round = current_position / 2
    end
  end

  def advance_player
    if (self.game.winner == self.team) && (self.round.number != self.tournament.rounds.maximum(:number))
      GameTeam.create(game: self.tournament.rounds[self.round.number].games.find_by(position: self.next_round_position), team: self.team)
    else (self.game.winner == self.team) && (self.round.number == self.tournament.rounds.maximum(:number))
      self.tournament.completed!
    end
  end
end
