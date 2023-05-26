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
  presence: true
  validates :is_deleted, inclusion: { in: [true, false] }
  validates :post_code, format: {with: /\A\d{7}\z/}, presence: true
  validates :telephone_number, format: {with: /\A0\d{10,11}\z/}, presence: true

  # フルネーム
  def full_name
    self.last_name + " " + self.first_name
  end

  def furigana_full_name
    self.furigana_last_name + " " + self.furigana_first_name
  end

  # 退会済みユーザーがログインできない
  def active_for_authentication?
    super && (is_deleted == false)
  end

  def customer_status
    if is_deleted == true
      "退会"
    else
      "有効"
    end
  end

end
