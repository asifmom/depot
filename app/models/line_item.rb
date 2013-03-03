class LineItem < ActiveRecord::Base
  attr_accessible :product, :quantity,:product_id
  belongs_to :product
  belongs_to :cart

  def total_price
    quantity*product.price
  end
end