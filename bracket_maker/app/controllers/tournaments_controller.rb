class TournamentsController < ApplicationController
  def new
    @tournament = Tournament.new
  end

  def create
    # render plain: params.inspect
    @tournament = Tournament.new(tournament_params)
    if @tournament.save
      redirect_to new_user_tournament_team
    else
      render new_user_tournament_path
    end
  end

private

  def tournament_params
    params.require(:tournament).permit(:name, :event_type, :teams)
  end

end
