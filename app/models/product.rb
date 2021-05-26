class Product < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :ordering_products, dependent: :destroy
  belongs_to :genre

  attachment :image
  enum is_active: { 販売中: true, 販売停止中: false }
  # ジャンルID、商品名、商品価格の制限
  validates :genre_id, :name, :price,:description, presence: true
  # 商品価格の整数制限
  validates :price, numericality: { only_integer: true }

end
