require 'rails_helper'

RSpec.describe Tournament, :type => :model do 
  let(:tournament) { Tournament.new(
    name: "Vavi Volleyball Intermediate",
    event: "Volleyball",
    admin_id: 1) }

  describe ".recent" do
    it "returns an ActiveRecord::Relation object" do
      expect(Tournament.recent).to be_a(ActiveRecord::Relation)
    end
  end

  describe "#winner" do
    pending "returns a Team object if the tournament is over" do
      tournament.completed = true
      expect(tournament.winner).to be_a(Team)
    end

    pending "returns a string notifying the user that the tournament isn't over" do
      tournament.completed = false
      expect(tournament.winner).to eq("Winner is not yet determined.")
    end
  end

  context "validations" do
    it { should validate_presence_of(:name) }
  end
  
end