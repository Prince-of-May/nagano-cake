class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to public_customers_my_page_path
  end

  def unsubscribe#未入力
  end

  def withdraw#未入力
    @customer = current_customer
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session#セッション情報を全て削除する
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private
  #params.require(:キー(モデル名)).permit(:カラム名１,：カラム名２,・・・)
  def customer_params
    params.require(:customer).permit(:family_name, :first_name, :family_name_rubi, :first_name_rubi, :email, :postal_code, :address, :phone_number, :is_deleted)
  end



end
