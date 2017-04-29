class RoundsController < ApplicationController
  def update
    # render plain: round_params.inspect
    update_round(round_params)
    round = Round.find(params[:id])
    redirect_to tournament_path(round.tournament)
  end

  private

  def round_params
    params.require(:round).permit!
  end

end
