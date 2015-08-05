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
end
