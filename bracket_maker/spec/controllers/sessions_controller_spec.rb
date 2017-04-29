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
    before(:all) { User.create(username: 'Bill', email: 'bill@aol.com', password: 'ducktyping') }
    context "when params are valid" do
      subject(:post_request) {post :create, params: { session: { email: 'bill@aol.com', password: "ducktyping"} } }

      it "responds with status code of 302" do
        # p post_request.inspect
        post_request
        expect(response).to have_http_status 302
      end

      # it "create a new session" do
      #   post_request
      #   expect(assigns()).to eq

      # end

      it "assigns the user as @user" do
        post_request
        expect(assigns(:user)).to eq(User.last)
      end

      it "redirects to the profile page" do
        post_request
        expect(response).to redirect_to user_path(User.last.id)
      end

    context "when params are invalid" do
      subject(:bad_post_request) {post :create, params: { session: { email: 'bill@aol.com', password: "no"} } }
      it "responds with a status code of 401" do
        bad_post_request
        expect(response).to have_http_status 401
      end
      it "sets a notice that the login failed"
      it "renders the :new template"
    end

  end

#   describe "DELETE #destroy" do
#     it "sets the session as nil"
  end

end
