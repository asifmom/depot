class ApplicationController < ActionController::Base
  protect_from_forgery
  private

  def session_cart
    session[:cart_id]
  end

  def current_cart
    cart=nil
    begin
      cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id]=cart.id
    end
    cart
  end

end
