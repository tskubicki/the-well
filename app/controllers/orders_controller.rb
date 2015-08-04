class OrdersController < ApplicationController
  def index
    if params[:order_id].present?
      @order = Order.find params[:order_id]
      @order = @user.order
    else
      @order = Order.all
    if params[:order_completed].present?
      @order = Order.where(id: current_user.id, order_completed: false)
    end
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
    if @order.destroy
    puts "deleted"
  else
    #failure
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @user.save
      puts "Updated"
    else
      puts "Update Failed"
  end

  def show
    @card = Card.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit[:user_id, :order_id, :table_number]
  end
end
