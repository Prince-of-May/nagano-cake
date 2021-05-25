class Public::GenresController < ApplicationController
  def index
     @products = Product.all
     
  end 
end
