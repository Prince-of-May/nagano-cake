class Public::ProductsController < ApplicationController

  def index
    @products = Product.all
    @search_params = genre_search_params
    @genres = Genre.search(@search_params).includes(:genre_id)
    
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end

private

  def genre_search_params
    params.fetch(:search, {}).permit(:genre_id, :name, :image_id, )
  end
end
