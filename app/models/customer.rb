class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy

  
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_rubi, presence: true
  validates :first_name_rubi, presence: true
  validates :postal_code, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
  
  def active_for_authentication?
    super && (is_deleted == false)
  end


end
