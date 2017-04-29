class TeamsController < ApplicationController

  def new
    #<ActionController::Parameters {"controller"=>"teams", "action"=>"new", "user_id"=>"5", "tournament_id"=>"14"} permitted: false>
    @games = Tournament.find(params[:tournament_id]).rounds.first.games
    @round = Tournament.find(params[:tournament_id]).rounds.first
  end

  def create
    raise params
  end
end
