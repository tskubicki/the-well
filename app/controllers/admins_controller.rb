class AdminsController < ApplicationController
	def index #if admin, get and show all admins in ERB, otherwise redirect to root
		if admin_signed_in?
			@admins = Admin.all
		end
	end

	def show #placeholder page for a admin's profile page
				if current_admin
					@users = User.all
					@admin = current_admin.inspect
					@waiters = Waiter.all
					@orders = Order.all
				end
	end

	def create
		if current_admin
				@waiters = Waiter.new
				@waiters.save
		    redirect_to @waiters
		end

	end

	def update
		if current_admin
				@waiters = Waiter.all(params[:id])
				@waiters.update(item_params)
			  	if @waiters.save
					puts "success"
					redirect_to @waiters
				else
					puts "failure"
				end
		end
	end

	def delete
		if current_user
			@waiters = Waiter.find(params[:id])
			if @waiters.destroy
				puts "deleted"
			else
				puts "failure"
			end
		end
	end
end
