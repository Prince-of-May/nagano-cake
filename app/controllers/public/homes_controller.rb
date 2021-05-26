class Public::HomesController < ApplicationController

  def top
    @products = Product.order("id DESC").page(params[:page]).per(4)
  end

  def about
  end
end

