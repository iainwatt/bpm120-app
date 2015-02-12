class FavouritesController < ApplicationController

  def new
    @favourite = Favourite.new
  end

  def create
    @favourite = Favourite.create(favourite_params)

    respond_to do |format|
      if @favourite.save
        format.html { redirect_to song_path(@favourite.song_id), notice: 'Song added to favourites' }
        format.json { render :show, status: :created, location: @favourite }
      else
        format.html { render :new }
        format.json { render json: @favourite.errors, status: :unprocessable_entity }
      end
   end
 end

  def favourite_params
    params.require(:favourite).permit(:user_id, :song_id)
  end

end

