class MypostController < ApplicationController
	before_action :authenticate_user!
	def index
		@post = Post.where(user_id: params[:user_id])
	end
end
