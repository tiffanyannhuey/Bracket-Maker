class Tournament < ApplicationRecord
  has_many :rounds
  has_many :teams
  has_many :games, through: :rounds
  belongs_to :admin, class_name: "User"

  after_create :rounds_games

  validates :name, :event_type, :admin_id, presence: true

  validates :completed, inclusion: { in: [true, false] }

  validates_associated :rounds, :games, :teams

  scope :recent, -> { order("created_at DESC").limit(6) }

  def teams=(number_of_teams)
    @teams = number_of_teams
  end

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
    round_assign(@teams).each do |round, game|
    self.rounds.create(number: round).games.push(game.times.with_object([]) {|position, collection| collection << Game.new(position: position + 1)})
    end
  end

end

