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

  has_one_attached :item_image

  def get_image
    unless item_image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      item_image.attach(io: File.open(file_path),filename:"no_image.jpg",content_type:"image/jpeg")
    end
    item_image
  end

end
