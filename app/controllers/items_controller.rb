class ItemsController < ApplicationController
  def index
    @item = Item.all
  end


  def new
    @item = Item.new()
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to @item
  end

  
  def destroy
   @item = Item.find(params(:id))
    if @item.destroy
      puts "success"
      redirect_to @item
    else
      puts "failure"
    end

  end

   def show
    @item = Item.find(params[:id])
  end

  def update
     @item = Item.find(params(:id))
     @item.update(item_params)
    if @item.save
      puts "success"
      redirect_to @item
    else
      puts "failure"
    end
  end




private

def item_params
    params.require(:item).permit(:title, :price)
  end

end
