class WelcomeController < ApplicationController
  def index
	if current_user
		redirect_to user_path(current_user)
	elsif current_waiter
		redirect_to waiter_path(current_waiter)
	elsif current_admin
		redirect_to admin_path(current_admin)
	end
  end

  def menu
   @item = Item.all
  end
end
