class Item < ApplicationRecord

#カート商品（中間テーブル）とのアソシ
  has_many :cart_items, dependent: :destroy

  #注文・注文商品とのアソシ
  has_many :order_items, dependent: :destroy
  has_many :oeder, through: :oeder_items

  belongs_to :genre

  #バリデーション設定
  validates :name, :description, :price_without_tax, presence: true
  validates :is_on_sale, inclusion: { in: [true, false] }

end
