require 'rails_helper'

xfeature "signing up a user" do
  scenario "the user visits the sign up page and creates account" do
    visit "/signup"
    # user = double("user", :username => "Tom", :email => "tom@gmail.com", :password => "password")

    within("body") do
      click_link("Sign Up", :href => "/login")
    end

    expect(page).to have_current_path("/login")
  end
end
