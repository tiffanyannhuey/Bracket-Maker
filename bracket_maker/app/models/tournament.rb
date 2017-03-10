class Tournament < ApplicationRecord
  has_many :rounds
  has_many :teams
  has_many :games, through: :rounds
  has_many :game_teams, through: :games
  belongs_to :admin, class_name: "User"

  after_create :rounds_games

  validates :name, :event_type, :admin_id, :number_of_teams, presence: true

  validates_associated :teams,  :games

  scope :recent, -> { order("created_at DESC").limit(6) }

  def winner
    if self.completed
      "hi"
    else
      "Winner is not yet determined."
    end
  end

  attr_accessor :number_of_teams

  private

  def round_assign(n)
      rounds = {}
      round = 1
    until n == 1
      rounds[round] = n/2
      n -= n/2
      round += 1
    end
    rounds
  end

  def rounds_games
    round_assign(number_of_teams.to_i).each do |round, game|
      self.rounds.create(number: round).games.push(game.times.with_object([]) {|position, collection| collection << Game.new(position: position + 1)})
    end
  end

end
