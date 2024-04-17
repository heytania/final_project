module ApplicationHelper
  def cart_total
    Product.where(id: @cart).sum(:price).round(2)
  end
end
