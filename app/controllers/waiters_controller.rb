class WaitersController < ApplicationController
	def index #if admin, get and show all waiters in ERB, otherwise redirect to root
		if admin_signed_in?
			@waiters = Waiter.all
		else
			redirect_to '/users/sign_in'
		end
	end
	
	def show #placeholder page for a waiter's profile page
		if current_waiter
			@user = current_waiter.inspect
		else
			redirect_to '/users/sign_in'
		end
	end
end
