class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user = @current_user || User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def update_round(params)
    params['game_attributes'].each do |key, attributes|
      attributes.each do |game, teams|
        teams.each do |id, name|
          Team.find(id).update(name: name['name'])
        end
      end
    end
  end
end
