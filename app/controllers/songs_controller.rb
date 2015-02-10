class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]


  def index
    @songs = Song.all
  end


  def show
    @comment = Comment.new
  end


  def new
    @song = Song.new
  end

  def edit
  end

  def create
    @song = current_user.songs.new(song_params)
    

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_song
      @song = Song.find(params[:id])
    end


    def song_params
      params.require(:song).permit(:title, :artist, :length, :url, :user_id)
    end
end
