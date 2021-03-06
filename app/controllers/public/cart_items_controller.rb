class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
    #@cart_items = curent_customer.cart_items
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    # @cart_item = current_customer.cart_items.new(cart_item_params) で9,10行目をまとめて一つにできる。
    if @cart_item.save
    redirect_to public_cart_items_path
    else
    redirect_to public_product_path(params[:cart_item][:product_id])
    flash[:notice] = "個数を選択してください！！"
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
     current_customer.cart_items.destroy_all
     redirect_to public_cart_items_path
  end

  private
  def cart_item_params
     params.require(:cart_item).permit(:amount, :product_id, :customer_id)
    # ストロングパラメーター（）
    # requireに入るのはモデル名、permitに入るのはsaveさせるカラム名
  end

end
