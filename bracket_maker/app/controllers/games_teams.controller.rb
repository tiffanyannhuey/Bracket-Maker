class GameTeamsController < ApplicationController

  def create
    render plain: params.inspect
  end

  def update
     render plain: params.inspect
  end

  def show
    render plain: params.inspect
  end

end
