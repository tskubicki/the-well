class WaitersController < ApplicationController
	def index #if admin, get and show all waiters in ERB, otherwise redirect to root
		if admin_signed_in?
			@waiters = Waiter.all
		else
			redirect_to '/users/sign_in'
		end
	end


	def show
		if current_waiter
			@currentorders = Order.where(waiter_id: current_waiter.id, order_completed: false)
			@admin = current_admin.inspect
			@waiters = Waiter.all
			# def new
		  #   @waiter = Waiter.new()
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
		if current_admin
				@waiters = Waiter.find(params[:id])
		    if @waiters.destroy
		    	puts "deleted"
		  	else
		    		puts "failure"
		    end
		end
	end
end
