module Public::CartItemsHelper
  def tax_price(price)
    (price*1.1).floor
  end

  def sub_price(sub)
    tax_price(sub.product.price) * sub.amount
  end

  def total_price(totals)
    price = 0
    totals.each do |total|
      price += sub_price(total)
      # price = price+数字　（＋＝）
    end
    return price
  end
end
