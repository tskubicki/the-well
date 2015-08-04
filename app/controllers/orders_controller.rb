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
    @order = Order.deleted
    render :index
  end

  def show
    @card = Card.find(params[:id])
  end
end
