class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shipping_addresses, dependent: :destroy
  #カート商品（中間テーブル）とのアソシ
  has_many :cart_items , dependent: :destroy
  has_many :orders , dependent: :destroy

  #バリデーション設定
  validates :last_name,
            :first_name,
            :furigana_last_name,
            :furigana_first_name,
            :post_code,
            :address,
            :telephone_number,
  presence: true
  validates :is_deleted, inclusion: { in: [true, false] }

end
