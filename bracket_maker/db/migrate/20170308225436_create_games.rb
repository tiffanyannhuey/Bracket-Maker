class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :round_id, null:false
      t.integer :position, null:false
      t.text :notes

      t.timestamps
    end
  end
end
