class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    if @playlist.save
      redirect_to @playlist
    else
      render :new
    end
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy
    redirect_to playlists_url
  end

  def add_song
    @playlist = Playlist.find(params[:id])
    @playlist.playlist_entries.create(song_id: params[:song_id])
    redirect_to @playlist
  end

  def remove_song
    @playlist = Playlist.find(params[:id])
    entries = @playlist.playlist_entries.where(song_id: params[:song_id]).destroy_all
    redirect_to @playlist
  end

  private
  def playlist_params
    params.require(:playlist).permit(:name)
  end
end
