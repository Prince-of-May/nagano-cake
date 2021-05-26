class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!


  def index
    #@orders = Order.all
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @ordering_products = @order.ordering_products
    @sum = 0
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status == "入金確認"
      @order.ordering_products.each do |ordering_product|
      ordering_product.update(making_status: "製作待ち")
    end
    end
    redirect_to admin_order_path(@order.id)
  end


  private

  def order_params
    params.require(:order).permit(:status)
  end

end