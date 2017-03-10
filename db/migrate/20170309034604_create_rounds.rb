class CreateRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.integer :tournament_id, null:false
      t.integer :number, null:false

      t.timestamps
    end
  end
end
