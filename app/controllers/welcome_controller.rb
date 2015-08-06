class WelcomeController < ApplicationController
  def index
	if current_user
		redirect_to '/users'
	elsif current_waiter
		redirect_to '/waiters'
	elsif current_admin
		redirect_to '/admins'
	end
  end

  def menu
   @item = Item.all
  end
end
