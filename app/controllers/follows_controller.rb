class FollowsController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@follow = Follow.new()
		@follow.follower_id = current_user.id
		@follow.followed_id = params[:followed_id]
		@follow.save
		respond_to do |format|
  			format.js {render inline: "location.reload();" }
		end
	end
	
	def destroy
		Follow.find_by(followed_id: params[:id], follower_id: current_user.id).destroy
		respond_to do |format|
  			format.js {render inline: "location.reload();" }
		end
	end
end