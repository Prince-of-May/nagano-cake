class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    # 論理削除とkaminari,未作成
    @customers = Customer.page(params[:page]).per(2)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])

  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:family_name,:first_name,:family_name_rubi,:first_name_rubi,:postal_code,:address,:phone_number,:email,:is_deleted)
  end

end
