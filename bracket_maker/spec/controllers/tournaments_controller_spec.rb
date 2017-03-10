require 'rails_helper'

RSpec.describe TournamentsController, type: :controller do

  let!(:tournament) { Tournament.new }

  describe "GET #index" do
    before :each do
      get :index
    end

    it "responds with an HTTP status code of 200" do
      expect(response).to have_http_status(200)
    end

    it "assigns recent tournaments to @tournaments" do
      expect(assigns(:tournaments)).to eq Tournament.recent
    end
  end

end
