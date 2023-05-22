class ShippingAddress < ApplicationRecord

  belongs_to :customer

  #バリデーション設定
  validates :name, :postal_code, :address, presence: true

end
