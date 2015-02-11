class UserFollowersController < ApplicationController
  before_filter :authenticate_user!, only: [:new]

  def new
    if params[:follower_id]
      @follower = User.where(profile_name: params[:friend_id]).first
      raise ActiveRecord::RecordNotFound if @friend.nil?
      @user_follower = current_user.user_followers.new[folower: @friend] 
    else
      flash[:error] = "Friend required"
   end
   rescue ActiveRecord::RecordNotFound
    render file: 'public/404', status: :not_found
  end

  def create
    if params[:follower_id]
      @follower = User.where(profile_name: params[:friend_id]).first
      @user_follower = current_user.user_followers.new[folower: @friend] 
      @user_follower.save
      flash[:success] = "You are now following #{@follower.full_name}"
      redirect_to profile_path(@follower)
    else
      flash[:error] = "friend required"
      redirect_to root_path
    end
  end
# attr_accessible :user, :follower, :user_ud, :friend_id These need to go in strong params
end
