class Item < ApplicationRecord


  has_many :cart_items, dependent: :destroy


  has_many :order_items, dependent: :destroy
  has_many :oeder, through: :oeder_items

  belongs_to :genre


  validates :name, :description, :price_without_tax, presence: true
  validates :is_on_sale, inclusion: { in: [true, false] }

end
