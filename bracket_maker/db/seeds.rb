5.times { User.create!(
    username: Faker::Internet.user_name(Faker::HarryPotter.character),
    email: Faker::Internet.free_email,
    password: "password"
  )}

User.first.tournaments.create!(name: "All Star Basketball Tournament", event_type: "Basketball", number_of_teams: 6)
User.second.tournaments.create!(name: "Vavi Volleyball tournament", event_type: "Volleyball", number_of_teams: 15)
User.last.tournaments.create!(name: "Cornhole Championship", event_type: "Cornhole", number_of_teams: 18)
User.first.tournaments.create!(name: "Bocce Ball Bash", event_type: "Bocce Ball", number_of_teams: 5)
User.fourth.tournaments.create!(name: "DDR Legends", event_type: "DDR", number_of_teams: 31)