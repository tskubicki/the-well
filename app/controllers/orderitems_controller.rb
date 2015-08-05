class OrderitemsController < ApplicationController
  def index#GET route - list all orderitems
  end
  def create#POST route - create new entry in the table(user adds item to order)
  end
  def new#GET route - The view for create new entry in the table(user adds item to order)
  end
  def edit#GET route - the view for editing a specific record in orderitem table
  end
  def show#GET route - the view for show specific record in orderitem table
  end
  def update#PATCH route - editing a specific record in orderitem table
  end
  def destroy#destroy orderitem record
  end
end
