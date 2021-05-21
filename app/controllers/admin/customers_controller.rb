class Admin::CustomersController < ApplicationController

  def index
    # 論理条件とkaminari,未作成
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])

  end

  def update
    @customer = Customer.find(params[:id])
    redirect_to admin_customer_path(@customer.id)
  end

end
