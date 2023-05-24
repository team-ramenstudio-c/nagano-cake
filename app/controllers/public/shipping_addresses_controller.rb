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
    if @shipping_address.save
     # 保存に成功した場合の処理
    redirect_to shipping_addresses_path, notice: "配送先を登録しました。"
    else
      # 保存に失敗した場合の処理
      @shipping_addresses = current_customer.shipping_addresses
      render :index
      flash.now[:alert] = "配送先の登録に失敗しました。"
    end
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
      flash[:notice] = "変更が完了しました"
  end

  private

  def shipping_address_params
    params.require(:shipping_address).permit(:name, :address, :postal_code)
  end
end
