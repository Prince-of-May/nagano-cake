class Public::CartItemsController < ApplicationController
  
  def index
    @cart_items = Cart_Items.all
  end 
  
  def create
    @cart_item = Cart_Item.new(cart_item_params)
    @caart_item.product_id = Product.find(params[:id])
    @cart_item.save
    redirect_to  public_products_path
  end 
  
  def update
  end 
  
  def destroy
    @caart_item = Cart_Item.find(params[:id])
  end 
  
  def destroy_all
     Cart_Item.destroy_all
  end
  
  private
  def cart_item_params
     params.require(:caart_item).permit(:amount) 
    # ストロングパラメーター７行目の（）
    # requireに入るのはモデル名、permitに入るのはsaveさせるカラム名
  end
    
end
