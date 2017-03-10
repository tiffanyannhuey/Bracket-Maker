require 'rails_helper'

RSpec.describe Game, type: :model do

  let(:user) { User.create(username: 'joe', email: 'joe@joe.co', password: 'hello') }
  let(:tournament) { Tournament.create(name: "test", event_type: "test", admin: user, number_of_teams: 16) }
  let(:first_round) { tournament.rounds.first }
  let(:game) { first_round.games.first }
  let(:team_one) { Team.create(name: 'test1') }
  let(:team_two) { Team.create(name: 'test2') }
  let(:completed_game) do
    game.teams << [team_one, team_two]
    game.game_teams.first.update(won: true)
    #game.teams.first.winner!
    return game
  end

  describe "attributes" do
    it "has a position within a round" do
      expect(first_round.games.first.position).to eq 1
      expect(first_round.games.second.position).to eq 2
      expect(first_round.games.third.position).to eq 3
    end
    it "has a winner" do
      expect(completed_game.winner).to be team_one
    end
  end


  describe "associations" do
    it { should have_many(:game_teams) }
    it { should belong_to(:round) }
    it { should have_one(:tournament) }
    it { should have_one(:admin) }
    it { should have_many(:teams) }
  end

  describe "validations" do
    it { should validate_presence_of(:position) }
  end
end
