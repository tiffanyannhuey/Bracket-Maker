class SessionsController < ApplicationController
  def new
  end

  def create
    # render plain: params[:session].inspect
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to "/users/#{@user.id}"
    else
      render 'new', status: 401
    end
  end

  def destroy
    log_out
    redirect_to '/'
  end
end
