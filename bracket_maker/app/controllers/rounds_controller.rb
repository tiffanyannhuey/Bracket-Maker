class RoundsController < ApplicationController
  def update
    # render plain: round_params.inspect
    update_round(round_params)
    redirect_to '/'
  end

  private

  def round_params
    params.require(:round).permit!
  end

end
