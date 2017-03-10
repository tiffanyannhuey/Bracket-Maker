class Tournament < ApplicationRecord
  has_many :rounds
  has_many :teams, through: :games
  has_many :games, through: :rounds
  has_many :game_teams, through: :games
  belongs_to :admin, class_name: "User"

  accepts_nested_attributes_for :games

  after_create :round_assign

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

  def round_assign
      round = 1
      n = number_of_teams.to_i
    until n == 1
      if round == 1
        create_games_with_teams_for(round)
      else
        # create_games_without_teams
        self.rounds.create(number: round).games.push((n/2).times.with_object([]) {|position, collection| collection << Game.new(position: position + 1)})
      end
      n -= n/2
      round += 1
    end
    even_out_rounds
    end

  def even_out_rounds
    teams_left = number_of_teams.to_i
    self.rounds.each do |round|
      puts teams_left.odd?
      puts round.number
      if teams_left.odd?
        game = Game.create(position: round.games.maximum(:position) + 1)
        game.teams << Team.create(name: '')
        round.games << game
      end
    teams_left -= teams_left / 2
    end
  end

  def create_games_with_teams_for(round_number)
    new_games = (number_of_teams.to_i/2).times.with_object([]) do |position, collection|
      game = Game.create(position: position + 1)
      # teams = [Team.create(name: ''), Team.create(name: '')]
      game.teams << [Team.create(name: ''), Team.create(name: '')]
      collection << game
    end
    rounds.create(number: round_number).games << new_games
  end

  # def round_assign(n)
  #     rounds = {}
  #     round = 1
  #   until n == 1
  #     rounds[round] = n/2
  #     n -= n/2
  #     round += 1
  #   end
  #   rounds
  # end

  # def rounds_games
  #   round_assign(number_of_teams.to_i).each do |round, game|
  #     self.rounds.create(number: round).games.push(game.times.with_object([]) {|position, collection| collection << Game.new(position: position + 1)})
  #   end
  # end

end
