class Order < ApplicationRecord

  belongs_to :customer

  #商品・注文商品とのアソシ
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  #バリデーション設定
  validates :payment_method, :shipping_name, :shipping_post_code, :shipping_address, presence: true

  #enum設定
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_for_payment: 0, confirmation_of_payment: 1, in_production: 2, preparing_to_ship: 3, shipped: 4  }
 
  def include_postage
   self.billing_amount + self.postage
  end 
  
end
