require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "attributes" do
    it "has a position within a round" do
      round_1 = Round.create(tournament_id: 1, number: 1)
      round_1.games.push(3.times.with_object([]) {|position, collection| collection << Game.create(position: position + 1)})
      expect(round_1.games.first.position).to eq 1
      expect(round_1.games.second.position).to eq 2
      expect(round_1.games.third.position).to eq 3
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
