class FavouritesController < ApplicationController

  def new
    @favourite = Favourite.new
  end

  def create
    @favourite = Favourite.create(favourtie_params)

    respond_to do |format|
      if @favourite.save
        format.html { redirect_to current_user.profile_name, notice: 'Song added to favourites' }
        format.json { render :show, status: :created, location: @favourite }
      else
        format.html { render :new }
        format.json { render json: @favourite.errors, status: :unprocessable_entity }
      end
   end
 end

  def favourtie_params
    params.require(:favourite).permit(:user_id, :song_id)
  end

end

