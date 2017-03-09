
5.times { User.create!(
    username: Faker::Internet.user_name(Faker::HarryPotter.character),
    email: Faker::Internet.free_email,
    password: "password"
  )}

User.first.tournaments.create!(name: "All Star Basketball Tournament", event_type: "Basketball", teams: 6)
User.second.tournaments.create!(name: "Vavi Volleyball tournaments", event_type: "Volleyball", teams: 15)
User.last.tournaments.create!(name: "Cornhole Championship", event_type: "Cornhole", teams: 18)
