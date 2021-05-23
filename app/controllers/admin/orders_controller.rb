class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @ordering_products = @order.ordering_products.all
    @sum = 0
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order.id)
  end


  private
  
  def order_params
    params.require(:order).permit(:status)
  end
end
