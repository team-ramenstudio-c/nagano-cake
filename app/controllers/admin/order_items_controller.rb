class Admin::OrderItemsController < ApplicationController

  def update
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    @order_items = @order.order_items
    @order_item.update(order_item_params)
    @production_statuses = @order_items.pluck(:production_status)
    @order.update(status: "in_production") if @production_statuses.any?{|val| val == "in_production" }
    @order.update(status: "preparing_to_ship") if @production_statuses.all?{|val| val ==  "completion_of_production"}
    redirect_to admin_order_path(@order)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:production_status)
  end


end