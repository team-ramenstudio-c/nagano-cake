class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    cart_items = current_customer.cart_items
    if cart_items.present?
      @order = Order.new
      @shipping_address = ShippingAddress.all
    else
      flash[:notice] = "カートが空です"
      redirect_to request.referer
    end
  end

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items
    @total_amount = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @order.postage = 800
    @order_total_amount = @total_amount + @order.postage.to_i

    if params[:order][:select_address] == "0"
      @order.shipping_post_code = current_customer.post_code
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
      if ShippingAddress.exists?(id: params[:order][:address_id])
        @address = ShippingAddress.find(params[:order][:address_id])
        @order.shipping_name = @address.name
        @order.shipping_post_code = @address.postal_code
        @order.shipping_address = @address.address
      else
        flash[:notice] = "配送先情報がありません"
        render 'new'
      end
    elsif params[:order][:select_address] == "2"
      @order.shipping_name = params[:order][:shipping_name]
      @order.shipping_post_code = params[:order][:shipping_post_code]
      @order.shipping_address = params[:order][:shipping_address]
    else
      render 'new'
    end
    @address = "〒" + @order.shipping_post_code + @order.shipping_address
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items
    @total_amount = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @order.postage = 800
    @order.billing_amount = @total_amount + @order.postage.to_i

    if @order.save
      current_customer.cart_items.each do |cart_item|
        @order_item = OrderItem.new
        @order_item.item_id = cart_item.item_id
        @order_item.order_id = @order.id
        @order_item.price_including_tax = cart_item.subtotal
        @order_item.quantity = cart_item.quantity
        @order_item.production_status = 0
        @order_item.save
      end
      current_customer.cart_items.destroy_all
      redirect_to completed_orders_path
    else
      flash[:notice] = "注文ができませんでした"
      @order = Order.new(order_params)
      render 'new'
    end
  end

  def completed
  end

  def index
    @orders = current_customer.orders.all.page(params[:page]).per(5).order(created_at: :DESC)
  end

  def show
    @order = current_customer.orders.find(params[:id])
    @order_items = @order.order_items.all
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postage, :billing_amount, :status, :payment_method, :shipping_name, :shipping_post_code, :shipping_address)
  end

end
