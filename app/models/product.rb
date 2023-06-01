class Product < ApplicationRecord
  belongs_to :client
  belongs_to :category
  has_many :product_in_charges, dependent: :destroy
  has_many :negotiations, dependent: :destroy
end
