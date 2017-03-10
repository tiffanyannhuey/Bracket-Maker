require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "responds with status code 200 " do
      get :new
      expect(response).to have_http_status 200
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      subject(:post_request) {post :create, params: { user: { username: "Todd", email: "123@abc.com", password: "password"} } }

      it "responds with status code 302" do
        # valid_user = double("user", :username => "Tom", :email => "tom@gmail.com", :password => "password")
        # post :create, params: { user: {username: "Todd", email: "123@abc.com", password: "password"} }
        post_request
        expect(response).to have_http_status 302
      end

      it "creates a new user in the database" do
        expect{ post_request }.to change{User.count}.by(1)
      end

      it "assigns the newly created user as @user" do
        post_request
        expect(assigns(:user)).to eq(User.last)
      end

    end
  end
end
