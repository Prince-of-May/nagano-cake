class Admin::OrderingProductsController < ApplicationController

  def update
    @ordering_product = OrderingProduct.find(params[:id])
    @ordering_product.update(ordering_product_params)
    @order = @ordering_product.order

    #if @ordering_prod.status == "入金確"
      #@ordering_product.order.update(making_status: "製作中")
      #redirect_to admin_order_path(@ordering_product.id)
    #else
      
    #end
  end

  private

  def ordering_product_params
    params.require(:ordering_product).permit(:making_status)
  end

end