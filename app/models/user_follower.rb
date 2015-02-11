class UserFollower < ActiveRecord::Base
  belongs_to :user
  belongs_to :follower, class_name: 'User', foreign_key: 'follower_-id'

  # attr_accessible :user, :follower, :user_ud, :friend_id These need to go in strong params
end
