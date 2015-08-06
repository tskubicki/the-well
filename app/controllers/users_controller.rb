class UsersController < ApplicationController
	def index #if admin, get and show all users in ERB, otherwise redirect to root
		if admin_signed_in?
			@users = User.all
		else
			redirect_to '/users/sign_in'
		end
	end

	def show #placeholder page for a user's profile page
		if current_user
			@user = current_user.inspect
		else
			redirect_to '/users/sign_in'
		end
	end

	def update
			if current_admin
		@user = User.find(params[:id])
		@user = User.update(user_params)
			end
			redirect_to root_path

		end

	def destroy
		if current_admin
		@user = User.find(params[:id])
		@user.destroy
		end
		redirect_to root_path
	end
end
