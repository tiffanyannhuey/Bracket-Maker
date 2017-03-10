require 'rails_helper'

RSpec.describe GameTeam, type: :model do
  describe "attributes" do
    context "it indicates whether its associated team won its associated game" do
      let(:game_team) { GameTeam.new(game: Game.first, team: Team.first) }
        it "is false by default" do
          expect(game_team.won).to be false
        end
        it "indicates true when a team has won" do
          game_team.won = true
          expect(game_team.won).to be true
        end
    end
  end
  describe "associations" do
    it { should belong_to(:game) }
    it { should belong_to(:team) }
    it { should have_one(:tournament) }
  end
end
