require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "when params are valid" do
      it "responds with status code of 200"
      it "create a new session"
      it "redirects to the homepage"
    end

    context "when params are invalid" do
      it "sets a notice that the login failed"
      it "renders the :new template"
    end
  end

  describe "DELETE #destroy" do
    it "sets the session as nil"
  end

end
