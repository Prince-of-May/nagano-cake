class Public::ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end 
  
  def show
    @product = Product.find(params[:id])
  end 
  
  private
  #def params
    #params.require(:product).permit(:name, :description, :image, :price)
  #end
end
