class TournamentsController < ApplicationController

  def index # homepage
    @tournaments = Tournament.recent
  end

  def new
    @tournament = Tournament.new
  end

  def create

    @tournament = Tournament.new(tournament_params)
    @tournament.admin_id = params[:user_id]
    if @tournament.save

      redirect_to new_user_tournament_team(@tournament)
    else
      render :new
    end
  end


private

  def tournament_params
    params.require(:tournament).permit(:name, :event_type, :number_of_teams)
  end

end
