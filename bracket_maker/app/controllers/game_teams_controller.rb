class GameTeamsController < ApplicationController

def update
  # render plain: params.inspect
  # <ActionController::Parameters {"_method"=>"put", "authenticity_token"=>"RrZGQDGgKBJiRwuiWlkUklsd9XRAj7ZmV2bPE7Vz2HYh62vfZe3tRwFHWKie/5hxZxAb3AjMVJxkvL2+vKAOpw==", "controller"=>"game_teams", "action"=>"update", "tournament_id"=>"81", "id"=>"351"} permitted: false>
  GameTeam.find(params[:id]).update(won: true)

  redirect_to tournament_path(params[:tournament_id])
end

end
