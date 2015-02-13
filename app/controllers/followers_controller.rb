class FollowersController < ApplicationController
  before_filter :authenticate_user!, only: [:new]

  def new
    @follower = Follower.new
  end

  def create
    @follower = Follower.create(follower_params)
    redirect_to profile_path(@follower.user_id)
  end

  def follower_params
    params.require(:follower).permit(:user_id, :friend_id)  
    end
  end



