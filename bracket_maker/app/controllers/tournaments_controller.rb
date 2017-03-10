class TournamentsController < ApplicationController

  def index # homepage
    @tournaments = Tournament.recent
  end

  def new
    @tournament = Tournament.new
  end

  def show
    # render plain: params.inspect
    @tournament = Round.find(params[:id] ).tournament
  end

  def create

    @tournament = Tournament.new(tournament_params)
    @tournament.admin_id = params[:user_id]
    if @tournament.save

      redirect_to new_tournament_team_path(@tournament)
      # redirect_to "/users/#{params[:user_id]}/tournaments/#{@tournament.id}/teams/new"
    else
      render :new
    end
  end

  def update
    render plain: params.inspect
  end


  private

  def tournament_params

    params.require(:tournament).permit(:name, :event_type, :number_of_teams)
    
  end

end
