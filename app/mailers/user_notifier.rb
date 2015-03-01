class UserNotifier <  ActionMailer::Base


	def follower_requested(follower_id)
		user_friendship = Follower.find(follower_id) 

		@user = follower.user
		@follower = follower.friend

		mail to: @friend.email, 
			subject: "#{user.first_name} wants to follow you on 120 BPM" 
	end

	def follower_request_accepted(follower_id)
		user_friendship = Follower.find(follower_id) 

		@user = follower.user
		@follower = follower.friend

		mail to: @user.email, 
			subject: "#{friend.first_name} has accepted your request" 
	end



end
