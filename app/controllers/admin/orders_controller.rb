class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_items =  @order.order_items
  end

  def update
   @order = Order.find(params[:id])
   @order_items = @order.order_items
   if @order.update(order_params)
    @order_items.update_all(production_status: "waiting_for_production") if @order.status == "confirmation_of_payment"
   end
    redirect_to request.referer
  end

  private
   def order_params
    params.require(:order).permit(:status)
   end

end
