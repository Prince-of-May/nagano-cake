class Public::AddressesController < ApplicationController
  
  def index
    @addresses = Address.all
  end 
  
  def create
  end 
  
  def edit
    @address = Address.find(params[:id])
  end 
  
  def update
  end 
  
  def destroy
  end 
    

end
