class Item < ApplicationRecord

  #カート商品（中間テーブル）とのアソシ
  has_many :cart_items, dependent: :destroy


  has_many :order_items, dependent: :destroy
  has_many :oeder, through: :oeder_items

  belongs_to :genre

  has_one_attached :image

  validates :name, :description, :price_without_tax, presence: true
  validates :is_on_sale, inclusion: { in: [true, false] }

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join("app/assets/images/cake.jpg")
      image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  ## 消費税を求めるメソッド
  def with_tax_price
    (price_without_tax * 1.1).floor
  end

  ## 販売ステータスを日本語で表示するためのメソッド
  def sale_status
    if is_on_sale == true
      "販売中"
    else
      "売切れ"
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "genre_id", "id", "is_on_sale", "name", "price_without_tax", "updated_at"]
  end
end

