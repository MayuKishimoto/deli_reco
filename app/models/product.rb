class Product < ApplicationRecord
  belongs_to :client
  belongs_to :category
  has_many :product_in_charges, dependent: :destroy
  has_many :product_in_charge_users, through: :product_in_charges, source: :user
  has_many :negotiations, dependent: :destroy
end
