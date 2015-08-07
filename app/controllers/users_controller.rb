class UsersController < ApplicationController
	def index #if admin, get and show all users in ERB, otherwise redirect to root
		if admin_signed_in?
			@users = User.all
			@item = Item.all
		else
		
		end
	end

	def show #placeholder page for a user's profile page
		# showing all items
		@item = Item.all
		# showing the order with selected items
		@order = Order.find(1)
		@items_in_order = Order.find(1).items
		@order_total = 0
		@items_in_order.each{|e| @order_total += e.price} 
	end

	def create
			if current_admin
				@user = User.new
				@user.save
		  
			end
	end

	def update
		if current_admin
			@user = User.all(params[:id])
			@user.update(item_params)
				if @user.save
			      puts "success"
			      
			    else
			      puts "failure"
			    end
		end
	end

	def delete
		if current_admin
				@user = User.find(params[:id])
		    if @user.destroy
				puts "deleted"
			else
				puts "failure"
			end
		end

		if current_user
			@user = current_user.inspect
			@item = Item.all
		else
			
		end
	end

	def update
		if current_admin
			@user = User.find(params[:id])
			@user = User.update(user_params)
		end
		
	end

	def destroy
		if current_admin
			puts params[:id]
			@user = User.find(params[:id])
			@user.destroy
		end
		
	end
end
