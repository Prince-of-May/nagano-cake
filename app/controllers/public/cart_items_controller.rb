class Public::CartItemsController < ApplicationController
  
  def index
  end 
  
  def create
    @item = Cart_Items.new(item_params)
  end 
  
  def update
  end 
  
  def destroy
  end 
  
  def destroy_all
  end
  
  private
  def item_params
    params.require(:caart_item).permit(:name, :description, :image, :price)  end
    
end
