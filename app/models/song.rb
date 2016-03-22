class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :playlists, through: :playlist_entries
end
