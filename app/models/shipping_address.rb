class ShippingAddress < ApplicationRecord

  belongs_to :customer

  #バリデーション設定
  validates :name, :postal_code, :address, presence: true

 #配送先情報を表示するためのメソッド
  def address_display
    "〒" + postal_code + " " + address + " " + name
  end

end
