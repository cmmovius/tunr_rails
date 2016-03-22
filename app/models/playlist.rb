class Playlist < ActiveRecord::Base
  has_many :playlist_entries
  has_many :songs, through: :playlist_entries
end
