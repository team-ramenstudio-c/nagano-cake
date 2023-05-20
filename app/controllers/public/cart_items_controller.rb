class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = CartItem.all
  end

  def create
    # binding.pry
    @cart_item = CartItem.new(cart_item_params)
    if cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.quantity += params[:cart_item][:quantity].to_i
      cart_item.save
      redirect_to cart_items_path
    elsif @cart_item.save
      @cart_items = CartItem.all
      render 'index'
    else
      render 'index'
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :quantity)
  end

end
