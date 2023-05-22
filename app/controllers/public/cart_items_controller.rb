class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
    #合計金額算出
    @total_amount = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end

  def create
    # binding.pry（gem "pry-byebug"用の機能）
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.quantity += params[:cart_item][:quantity].to_i
      cart_item.save
      redirect_to cart_items_path, notice: '選択された個数分を追加しました'
    elsif @cart_item.quantity.nil?
        redirect_to request.referer, notice: '個数を選択してください'
    elsif @cart_item.save
      @cart_items = current_customer.cart_items.all
      redirect_to cart_items_path, notice: 'カートに商品が追加されました'
    else
      redirect_to request.referer, notice: 'もう一度個数を指定してください'
    end
  end

  def update
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.update(cart_item_params)
    # redirect_to request.referer, notice: '情報更新が更新されました'
    @cart_items = current_customer.cart_items.all
    @total_amount = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end

  def destroy
    current_customer.cart_items.find(params[:id]).destroy
    redirect_to request.referer, notice: '該当商品が削除されました'
  end

  def clear
    current_customer.cart_items.destroy_all
    redirect_to request.referer, notice: 'カート内が空になりました'
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :quantity)
  end

end
