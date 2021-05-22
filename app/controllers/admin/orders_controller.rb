class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @ordering_products = @order.ordering_products.all
  end

  def update
  end

end
