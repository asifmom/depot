class CartsController < ApplicationController
  def show
    begin
      @cart=Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid cart"
      redirect_to store_path, :notice => "invalid cart"
    end
  end

  def destroy
    begin
      @cart=Cart.find(params[:id])
      @cart.destroy
      session[:card_id]=nil
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to destroy invalid cart"
      redirect_to store_path, :notice => "invalid destroy cart"
    end
    redirect_to store_path, :notice => "Cart emptied"

  end
end