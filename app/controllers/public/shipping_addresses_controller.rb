class Public::ShippingAddressesController < ApplicationController
  def index
    @shipping_addresses = current_customer.shipping_addresses
    @shipping_address = ShippingAddress.new
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def create
     @shipping_address = ShippingAddress.new(shipping_address_params)
     @shipping_address.customer_id = current_customer.id
     @shipping_address.save
     redirect_to shipping_addresses_path
  end

  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.destroy
    redirect_to request.referer
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.update(shipping_address_params)
    redirect_to shipping_addresses_path
  end

  private

  def shipping_address_params
    params.require(:shipping_address).permit(:name, :address, :postal_code)
  end
end
