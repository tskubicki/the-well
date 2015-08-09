class OrdersController < ApplicationController
  def index
    if params[:order_id].present?
      @order = Order.find params[:order_id]
      @order = @user.order
    else
      @order = Order.all
	end
    if params[:order_completed].present?
      @order = Order.where(id: current_user.id, order_completed: false)
    end
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    # @order.users << current_user
    if @order.valid?
      @order.save!
      redirect_to orders_path
    end
  end

  def destroy
    @order = Order.find(params[:id])
	
	respond_to do |format|
		format.js
			@order.destroy
	end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.save
      puts "Updated"
      redirect_to waiter_path
    else
      puts "Update Failed"
      redirect_to waiter_path
    end
  end

  def show
    @card = Card.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:user_id, :waiter_id, :order_id, :table_number, :order_completed)
  end
  
end
