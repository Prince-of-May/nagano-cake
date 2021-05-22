class Public::OrdersController < ApplicationController
  
  def new
  end 
  
  def create
  end 
  
  def index
    @orders = current_customer.orders#ログインユーザーのordersモデルを全て取得する（命名規則により、モデル名の前にメソッドがある場合ordersの頭文字は小文字にする）
  end 
  
  def show
  end 
  
end
