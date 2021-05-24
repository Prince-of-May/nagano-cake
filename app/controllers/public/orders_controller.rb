class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm

    @cart_items = CartItem.where(customer_id: current_customer.id)
    @order = Order.new(order_params)
    redirect_to  public_orders_confirm_path
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
  end

  def index
    @orders = current_customer.orders#ログインユーザーのordersモデルを全て取得する（命名規則により、モデル名の前にメソッドがある場合ordersの頭文字は小文字にする）
  end

  def show
    @orders = current_customer.orders
    @delivery_charge = 800
  end
    #@orders = Order.where(:)

  private
    def order_params
      params.require(:order).permit(:customer_id, :total_payment, :payment_method, :address, :postal_code, :name)
    end

    def order_params
      params.require(:order).permit(:shipping_cost, :total_payment, :address, :postal_code, :name, :status, :customer_id )
    end

end



