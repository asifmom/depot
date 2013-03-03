class LineItemsController<ApplicationController
  def create
    product = Product.find(params[:product_id])
    @cart=current_cart
    line_item = @cart.add_product params[:product_id]
    line_item.save
    redirect_to cart_path(@cart.id),:notice => "line item for product #{product.title}created"
  end

  def destroy
    line_item = LineItem.find_by_id(params[:id])
    line_item.destroy
    redirect_to cart_path(current_cart.id),:notice => "line item destroyed"
  end

  private

end