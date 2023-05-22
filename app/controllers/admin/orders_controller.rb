class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end
  
  def update
   @order = Order.find(params[:id])
   if @order.update(order_params)
     redirect_to admin_order_path(@order.id)
    else
      render :show
    end
  end

  
end
