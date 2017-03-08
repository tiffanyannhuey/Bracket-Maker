require 'rails_helper'

feature "signing up a user" do
  scenario "the user visits the sign up page and creates account" do
    visit "/signup"

    within(".container") do
      click_link("Sign Up", :href => "/login")
    end

    exepct(page).to have_current_path("/login")
  end
end
