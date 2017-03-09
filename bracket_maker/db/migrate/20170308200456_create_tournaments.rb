class CreateTournaments < ActiveRecord::Migration[5.0]
  def change
    create_table :tournaments do |t|
      t.string  :name, null: false
      t.string  :event_type, null: false
      t.integer :admin_id, null: false
      t.boolean :completed, default: false
      t.timestamps(null: false)
    end
  end
end
