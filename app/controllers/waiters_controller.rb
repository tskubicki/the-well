class WaitersController < ApplicationController
	before_action :authenticate_waiter!
  def index
  end
  
  def new
	@order = Order.new()
  end
  
  def edit
	
  end
  
  def show
  end
  
  def update
  end
  
  def destroy
  end
  
end
