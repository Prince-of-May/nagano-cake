class Admin::ProductsController < ApplicationController

  def index
    @product = Product.new
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
  	   redirect_to new_admin_product_path
   #else
  	   #render "new"
   #end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_product_path(@product.id)
    else
      render "new"
    end
  end

  private
  def product_params
    params.require(:product).permit(:genre_id, :name, :description, :image, :price, :is_active)
  end


end
