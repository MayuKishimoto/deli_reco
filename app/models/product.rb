class Product < ApplicationRecord
  belongs_to :client
  belongs_to :category
  has_many :product_in_charges, dependent: :destroy
  has_many :product_in_charge_users, through: :product_in_charges, source: :user
  has_many :negotiations, dependent: :destroy
  validates :assumed_name, length: { maximum: 255 }
  validates :purpose, length: { maximum: 5000 }
  validates :concept, length: { maximum: 5000 }
  # enum status: { 申請: 3, 承認: 2, 低: 1, 高: 3, 中: 2, 低: 1 }
end
