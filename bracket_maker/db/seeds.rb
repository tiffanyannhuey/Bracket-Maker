5.times { User.create!(
    username: Faker::Internet.user_name(Faker::HarryPotter.character),
    email: Faker::Internet.free_email,
    password: "password"
  )}


# Tournament.create!(name: "All Star Basketball Tournament", event_type: "Basketball", admin_id: users[0].id)
# Tournament.create!(name: "Vavi Volleyball Tournament", event_type: "Volleyball", admin_id: users[1].id)
# Tournament.create!(name: "Cornhole Championship", event_type: "Cornhole", admin_id: users[2].id)
# Tournament.create!(name: "Bocce Ball Bash", event_type: "Bocce Ball", admin_id: users[3].id)
# Tournament.create!(name: "DDR Legends", event_type: "DDR", admin_id: users[4].id)

User.first.tournaments.create!(name: "All Star Basketball Tournament", event_type: "Basketball", teams: 6)
User.second.tournaments.create!(name: "Vavi Volleyball tournaments", event_type: "Volleyball", teams: 15)
User.last.tournaments.create!(name: "Cornhole Championship", event_type: "Cornhole", teams: 18)
