class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params_[:id])
  end

  def edit
    @customer = Customer.find(params_[:id])
  end

  def update
    customer = Customer.find(params_[:id])
    customer.update(cutomer_params)
    redirect_to edit_public_customer_path(customer)
  end

  def unsubscribe
  end

  def withdraw
    
  end

  private
  #params.require(:キー(モデル名)).permit(:カラム名１,：カラム名２,・・・)
  def customer_params
    params.require(:customer).permit(:family_name, :first_name, :family_name_rubi, :first_name_rubi, :email, :postal_code, :address, :phone_number)
  end



end
