class WelcomeController < ApplicationController
  def index
	if current_user
		redirect_to '/user'
	elsif current_waiter
		redirect_to '/waiter'
	elsif current_admin
		redirect_to '/admin'
	end
  end

  def menu
   @item = Item.all
  end
end
