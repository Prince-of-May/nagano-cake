class Admin::OrderingProductsController < ApplicationController

  def update
    @ordering_product = OrderingProduct.find(params[:id])
    @ordering_product.update(ordering_product_params)
    redirect_to admin_order_path(@ordering_product.id)
  end
  
  private
  
  def ordering_product_params
    params.require(:ordering_product).permit(:making_status)
  end
  
end