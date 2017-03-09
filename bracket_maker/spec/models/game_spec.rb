require 'rails_helper'

RSpec.describe Game, type: :model do
  user = User.create(username: "test", email: "test@test.com", password: "test")
  tournament = user.tournaments.create

  describe "associations" do
    it "has_many teams through game_teams" do

    end
  end
end
