class RemoveColumnTournamentIdFromTeams < ActiveRecord::Migration[5.0]
  def change
    remove_column :teams, :tournament_id, :integer
  end
end
