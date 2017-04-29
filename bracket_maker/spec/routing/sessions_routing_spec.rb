require 'rails_helper'

RSpec.describe "Routing to sessions", :type => :routing do
  it "routes GET /login to sessions#new" do
    expect(:get => "/login").to route_to("sessions#new")
  end

  it "routes POST /login to sessions#create" do
    expect(:post => "/login").to route_to("sessions#create")
  end

  it "routes DELETE /logout to sessions#destroy" do
    expect(:delete => "/logout").to route_to("sessions#destroy")
    # need to come back to this one
  end
end
