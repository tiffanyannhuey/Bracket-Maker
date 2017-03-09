class UsersController < ApplicationController
  def new
  end

  def create
    render plain: params[:user].inspect
    @user = User.new(user_params)
    if @user.save
      log_in
      redirect_to 'show'
    else
      render 'new'
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end