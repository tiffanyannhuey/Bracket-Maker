class RoundsController < ApplicationController
  def update
    render plain: params.inspect
  end

end
