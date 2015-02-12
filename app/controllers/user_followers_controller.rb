class UserFollowersController < ApplicationController
  before_filter :authenticate_user!, only: [:new]


  def new
    if params[:follower_id]
      @follower = User.where(profile_name: params[:follower_id]).first      
      @user_follower = current_user.user_followers.new[folower: @follower] 
   end   
  end

  def create
    if params[:follower_id]
      @follower = User.where(profile_name: params[:follower_id]).first
      @user_follower = current_user.user_followers.new[folower: @follower] 
      redirect_to root_path
    end
  end

  def user_follower_params
  params.require(:user_follower).permit(:user_id, :follower_id)  
# attr_accessible :user, :follower??
end
