class ShippingAddress < ApplicationRecord

  belongs_to :customer

  #バリデーション設定
  validates :name, :address, presence: true
  validates :address, length: { maximum: 50 }, presence: true
  validates :postal_code, format: {with: /\A\d{7}\z/}, presence: true

 #配送先情報を表示するためのメソッド
  def address_display
    "〒" + postal_code + " " + address + " " + name
  end

end
