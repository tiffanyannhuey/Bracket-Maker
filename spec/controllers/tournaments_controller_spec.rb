require 'rails_helper'

RSpec.describe TournamentsController, type: :controller do

  let!(:tournament) { Tournament.create }

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

    it "renders the :index template" do
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    before :each do
      get :show
    end

    pending "it responds with an HTTP status code of 200" do
      expect(response).to have_http_status(200)
    end

    pending "it assigns the correct tournament as @tournament" do
      get :show, { id: tournament.id }
      expect(assigns(:tournament)).to eq(tournament)
    end

    pending "renders the :show template" do
      get :show, { id: game.id }
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    before :each do
      get :new
    end

    pending "it responds with an HTTP status code of 200" do
      expect(response).to have_http_status(200)
    end

    pending "it assigns a new tournament to @tournament" do
      get :new
      expect(assigns(:tournament)).to be_a_new Tournament
    end

    pending "it renders the :new template" do
      expect(response).to render_template(:new)
    end
  end

end
