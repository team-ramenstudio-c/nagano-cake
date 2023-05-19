class Genre < ApplicationRecord

has_many :items, dependent: :destroy

#バリデーション設定
validates :name, presence: true

end
