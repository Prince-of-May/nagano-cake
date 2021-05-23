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
  
  enum status: [ "入金待ち", "入金確認", "製作中", "発送準備中", "発送済み" ]
  
  enum making_status: [ "着手不可", "製作待ち", "製作中", "製作完了"]
end

