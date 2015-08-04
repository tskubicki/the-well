class UsersController < ApplicationController
	before_action :authenticate_user!
	def index
		redirect_to root_path
	end

	def create
		@user = User.new(user_params)
		if @user.save
			#success
		else
			#failure
		end
	end
	
	def new
		@user = User.new()
	end

	def edit
		@user = current_user
	end

	def show
		@user = current_user
	end

	def update
		@user = current_user
		@user.update(user_params)
		if @user.save
			#success
		else
			#failure
		end
	end

	def destroy
	end
	
	private
	def user_params
		params.require(:user).permit('stuff') #to be added. -TS
	end
end
