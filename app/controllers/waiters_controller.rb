class WaitersController < ApplicationController
	def index #if admin, get and show all waiters in ERB, otherwise redirect to root
		if admin_signed_in?
			@waiters = Waiter.all
		else
			redirect_to root_path
		end
	end
	
	def show
		@waiter = current_waiter
	end
end
