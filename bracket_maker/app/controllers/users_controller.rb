class UsersController < ApplicationController
  def new
  end

  def create
    # render plain: params[:user].inspect
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = current_user
    @tournaments = @user.tournaments
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
