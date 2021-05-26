class Public::HomesController < ApplicationController

  def top
    @products = Product.all.order("id DESC")
  end

  def about
  end
end
