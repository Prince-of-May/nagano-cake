class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end
  
  def confirm
    
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
    #@orders = Order.where(:)
  end 
end
