class AddPositionToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :position, :integer
  end
end
