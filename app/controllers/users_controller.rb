class UsersController < ApplicationController
	def index #if admin, get and show all users in ERB, otherwise redirect to root
		if admin_signed_in?
			@users = User.all
		else
			redirect_to '/users/sign_in'
		end
	end

	def show #placeholder page for a user's profile page
		if current_admin
			@admin = current_admin.inspect
			@user = User.all
		end
	end

	def create
			if current_admin
				@user = User.new
				@user.save
		  	redirect_to @user
			end
	end

	def update
		if current_admin
			@user = User.all(params[:id])
			@user.update(item_params)
				if @user.save
			      puts "success"
			      redirect_to @user
			    else
			      puts "failure"
			    end
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
  	end
	end

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
			puts params[:id]
			@user = User.find(params[:id])
			@user.destroy
		end
		redirect_to root_path
	end
end
