# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160322192818) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "photo_url"
    t.string "nationality"
  end

  create_table "playlist_entries", force: :cascade do |t|
    t.integer  "song_id"
    t.integer  "playlist_id"
    t.integer  "order"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "playlist_entries", ["playlist_id"], name: "index_playlist_entries_on_playlist_id", using: :btree
  add_index "playlist_entries", ["song_id"], name: "index_playlist_entries_on_song_id", using: :btree

  create_table "playlists", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string  "title"
    t.string  "album"
    t.string  "preview_url"
    t.integer "artist_id"
  end

  add_index "songs", ["artist_id"], name: "index_songs_on_artist_id", using: :btree

  add_foreign_key "playlist_entries", "playlists"
  add_foreign_key "playlist_entries", "songs"
  add_foreign_key "songs", "artists"
end
