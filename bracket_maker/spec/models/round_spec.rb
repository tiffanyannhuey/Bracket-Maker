require 'rails_helper'

RSpec.describe Round, type: :model do
  let(:round) { Round.create(number: 1, tournament_id: 1)}
  
  describe "validations" do
    it { should validate_presence_of(:number) }

    it { should have_many(:games) }

    it { should have_many(:teams) }

    it { should have_one(:admin) }

    it { should belong_to(:tournament) }

    round_columns = [:id, :number, :tournament_id]

    round_columns.each do |column|
      it { should have_db_column(column) }
    end

  end

  describe "associations" do
    it "has many games" do
      expect(round.games).to be_a(ActiveRecord::Relation)
    end

    it "has many teams" do
      expect(round.teams).to be_a(ActiveRecord::Relation)
    end
    
  end
end

