class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @comments = @user.comments.all
    @songs = @user.songs.all
    @follower = Follower.new
  end
end
