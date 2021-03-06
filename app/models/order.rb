class Order < ApplicationRecord
  belongs_to :customer
  has_many :ordering_products, dependent: :destroy

  
  enum payment_method: {
    "クレジットカード": 0,
    "銀行振込": 1,
  }
  
  
  enum status: [ "入金待ち", "入金確認", "製作中", "発送準備中", "発送済み" ]
  
  
end

