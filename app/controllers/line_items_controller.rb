class LineItemsController<ApplicationController
  def create
    product = Product.find(params[:product_id])
    @cart=current_cart
    @cart.line_items.create :product=>product

    redirect_to cart_path(@cart.id),:notice => "line item for product #{product.title}created"
  end

  private

end