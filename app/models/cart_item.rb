class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  #小計を求めるメソッド
  def subtotal
    item.with_tax_price * quantity
  end

  def item_with_tax_price
    item.with_tax_price
  end

end
