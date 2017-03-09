<<<<<<< HEAD
Tournament.create!(name: "All Star Basketball Tournament", event: "Basketball", admin_id: 1)
Tournament.create!(name: "Vavi Volleyball Tournament", event: "Volleyball", admin_id: 2)
Tournament.create!(name: "Cornhole Championship", event: "Cornhole", admin_id: 3)
=======
users = []
5.times { users << User.create!(
    username: Faker::Internet.user_name(Faker::HarryPotter.character),
    email: Faker::Internet.free_email,
    password: "password"
  )}

Tournament.create!(name: "All Star Basketball Tournament", event_type: "Basketball", admin_id: users[0].id)
Tournament.create!(name: "Vavi Volleyball Tournament", event_type: "Volleyball", admin_id: users[1].id)
Tournament.create!(name: "Cornhole Championship", event_type: "Cornhole", admin_id: users[2].id)
>>>>>>> 9db4ff4491b7a81a7293ea941135278be83f1df9

