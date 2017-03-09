require 'rails_helper'

xfeature "signing up a user" do
  scenario "the user visits the sign up page and creates account" do
    visit "/signup"
    # new_user = User.create(name: "Tom Thumb", email: "tom@gmail.com", password: "password")

    within(".container") do
      click_link("Sign Up", :href => "/login")
    end

    exepct(page).to have_current_path("/login")
  end
end
