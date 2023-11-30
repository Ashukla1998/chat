
class CartsController < ApplicationController
    before_action :authenticate_user!
  
    def show
      @cart = current_user.cart
      @cart_items = @cart.cart_items.includes(:product)
    end
  
    def add_to_cart
      product = Product.find(params[:product_id])
      quantity = params[:quantity].to_i
  
      if quantity.positive?
        cart_item = current_user.cart.cart_items.find_or_initialize_by(product: product)
        cart_item.update(quantity: cart_item.quantity + quantity)
        flash[:notice] = "#{quantity} #{'item'.pluralize(quantity)} added to your cart."
      else
        flash[:alert] = 'Quantity must be greater than zero.'
      end
  
      redirect_to products_path
    end
  
    def remove_from_cart
      cart_item = current_user.cart.cart_items.find_by(id: params[:id])
      cart_item&.destroy
      flash[:notice] = 'Item removed from your cart.'
      redirect_to cart_path
    end
  end
  