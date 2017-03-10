require 'rails_helper'

RSpec.describe Tournament, :type => :model do 
  let(:tournament) { Tournament.create(
    name: "Vavi Volleyball Intermediate",
    event_type: "Volleyball",
    admin_id: 1,
    teams: 6) }

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

    it "returns a string notifying the user that the tournament isn't over" do
      tournament.completed = false
      expect(tournament.winner).to eq("Winner is not yet determined.")
    end
  end

  describe "validations" do
    presence_variables = [:name, :event_type, :admin_id]

    presence_variables.each do |variable|
      it { should validate_presence_of(variable) }
    end

    it { should belong_to(:admin).class_name("User") }

    it { should have_many(:games) }

    it { should have_many(:teams) }

    tournament_columns = [:id, :name, :event_type, :admin_id, :completed, :created_at, :updated_at]
    
    tournament_columns.each do |column|
      it { should have_db_column(column) }
    end

  end
  
end