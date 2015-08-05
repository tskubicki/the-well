class AdminsController < ApplicationController
	def index #if admin, get and show all admins in ERB, otherwise redirect to root
		if admin_signed_in?
			@admins = admin.all
		end
	end
	
	def show #placeholder page for a admin's profile page
		if current_admin
			@admin = current_admin.inspect
		end
	end
end
