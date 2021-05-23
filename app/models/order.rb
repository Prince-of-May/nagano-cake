class Order < ApplicationRecord
  belongs_to :customer
  has_many :ordering_products, dependent: :destroy

  
  enum payment_method: {
    "クレジットカード": 0,
    "銀行振込": 1,
  }
  
  enum address: {
    "ご自身の住所": 0,
    "登録済住所から選択": 1,
    "新しいお届け先": 2,
  }
end

