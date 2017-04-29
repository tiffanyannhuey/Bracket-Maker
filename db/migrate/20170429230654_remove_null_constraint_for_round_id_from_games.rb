class RemoveNullConstraintForRoundIdFromGames < ActiveRecord::Migration[5.0]
  def change
    change_column_null :games, :round_id, true
  end
end
