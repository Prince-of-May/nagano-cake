class Public::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    #@cart_item = Cart_Item.new
  end

end
