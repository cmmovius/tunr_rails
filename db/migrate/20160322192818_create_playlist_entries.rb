class CreatePlaylistEntries < ActiveRecord::Migration
  def change
    create_table :playlist_entries do |t|
      t.references :song, index: true, foreign_key: true
      t.references :playlist, index: true, foreign_key: true
      t.integer :order

      t.timestamps null: false
    end
  end
end
