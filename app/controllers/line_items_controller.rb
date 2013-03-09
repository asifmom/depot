class LineItemsController<ApplicationController
  def create
    product = Product.find(params[:product_id])
    @cart=current_cart
    line_item = @cart.add_product params[:product_id]
    line_item.save
    @current_item=line_item
    #redirect_to store_url,:notice => "line item for product #{product.title}created"
    respond_to do |format|
      format.js
    end
  end

  def destroy
    line_item = LineItem.find_by_id(params[:id])
    line_item.destroy
    redirect_to cart_path(current_cart.id),:notice => "line item destroyed"
  end

  private

end