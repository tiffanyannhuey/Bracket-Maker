class Tournament < ApplicationRecord
  has_many :rounds
  has_many :teams
  has_many :games, through: :rounds
  belongs_to :admin, class_name: "User"


  validates :name, :event_type, :admin_id, presence: true

  validates :completed, inclusion: { in: [true, false] }

  validates_associated :rounds, :games, :teams

  scope :recent, -> { order("created_at DESC").limit(6) }

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

  def rounds_games(roster)
    roster.each do |round, game|
    bren.tournaments.last.rounds.create(number: round).games.push(game.times.with_object([]) {|position, collection| collection << Game.new(position: position + 1)})
    end
  end

end

