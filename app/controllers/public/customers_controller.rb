class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer#Customer.find(params_[:id])
  end

  def edit
    @customer = Customer.find(params_[:id])
  end

  def update
    customer = Customer.find(params_[:id])
    customer.update(cutomer_params)
    redirect_to public_customers_my_page_path
  end

  def unsubscribe#未入力
  end

  def withdraw#未入力
    
  end

  private
  #params.require(:キー(モデル名)).permit(:カラム名１,：カラム名２,・・・)
  def customer_params
    params.require(:customer).permit(:family_name, :first_name, :family_name_rubi, :first_name_rubi, :email, :postal_code, :address, :phone_number)
  end



end
