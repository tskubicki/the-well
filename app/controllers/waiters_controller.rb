class WaitersController < ApplicationController
	def index #if admin, get and show all waiters in ERB, otherwise redirect to root
		if admin_signed_in?
			@waiters = Waiter.all
		else
			redirect_to '/users/sign_in'
		end
	end


	#def show #placeholder page for a waiter's profile page
		# See current orders to wait on
 def view
		if current_admin
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


		@currentorders = Order.all

		# completion on orders table
		@ordercomplited = Order.where(waiter_id: current_waiter.id)

		if current_waiter
			@user = current_waiter.inspect
		else
			redirect_to '/users/sign_in'
		end

	end
end
