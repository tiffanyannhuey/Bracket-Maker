require 'rails_helper'

# describe Tournament do 
#   let(:tournament) { Tournament.new }

#   describe ".recent" do
#     it "returns an ActiveRecord::Relation object" do
#       expect(Tournament.recent).to be_a(ActiveRecord::Relation)
#     end
#   end

#   describe "#winner" do
#     it "returns a Team object if the tournament is over" do
#       tournament.completed = true
#       expect(tournament.winner).to be_a(Team)
#     end

#     it "returns a string notifying the user that the tournament isn't over" do
#       tournament.completed = false
#       expect(tournament.winner).to eq("Winner is not yet determined.")
#     end
#   end
  
# end