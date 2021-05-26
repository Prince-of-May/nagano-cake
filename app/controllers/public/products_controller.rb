class Public::ProductsController < ApplicationController

  def index
    @products = Product.all
    @product = Product.page(params[:page]).per(10)
    @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end


end
