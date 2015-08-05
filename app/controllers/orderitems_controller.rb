class OrderitemsController < ApplicationController

  def index#GET route - list all orderitems
    @orderitem = OrderItem.all
  end

  def create#POST route - create new entry in the table(user adds item to order)
    @orderitem = OrderItem.new(orderitem_params)
    @orderitem.save
    redirect_to orderitem_path
  end

  def new#GET route - The view for create new entry in the table(user adds item to order)
  @orderitem = OrderItem.new
  end

  def edit#GET route - the view for editing a specific record in orderitem table
  @orderitem = OrderItem.find(params[:id])
  end

  def show#GET route - the view for show specific record in orderitem table
  @orderitem = OrderItem.find(params[:id])
  end

  def update#PATCH route - editing a specific record in orderitem table
    @orderitem = OrderItem.find(params[:id])
    @orderitem.update(orderitem_params)
    if @orderitem.save
      puts "Updated"
    else
      puts "Update Failed"
  end
  end

  def destroy#destroy orderitem record
  @orderitem = OrderItem.find(params[:id])
    if @orderitem.destroy
    puts "deleted"
  else
    puts 'failure'
  end
  end

end
