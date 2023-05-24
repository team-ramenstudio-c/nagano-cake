class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  #小計を求めるメソッド
  def subtotal
    self.price_including_tax * self.quantity
  end

end
