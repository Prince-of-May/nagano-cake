class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @order = Order.new(order_params)
    @order.payment_method = params[:order][:payment_method]
    @delivery_charge = 800
    if params[:order][:address_kind] == "1"
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.family_name + current_customer.first_name

    elsif params[:order][:address_kind] == "2"
      @address = Address.find(params[:order][:address_id])
      @order.address = @address.address
      @order.postal_code = @address.postal_code
      @order.name = @address.name

    elsif params[:order][:address_kind] == "3"
      @order.address = params[:order][:address]
      @order.postal_code = params[:order][:postal_code]
      @order.name = params[:order][:name]
    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    current_customer.cart_items.each do |cart_item|
      OrderingProduct.create!(order_id: @order.id, product_id: cart_item.product_id, amount: cart_item.amount, price: @order.total_payment)
    end
    current_customer.cart_items.destroy_all
    redirect_to public_orders_complete_path
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
    params.require(:order).permit(:shipping_cost, :total_payment, :address, :postal_code, :name, :status, :customer_id, :payment_method )
  end

end
