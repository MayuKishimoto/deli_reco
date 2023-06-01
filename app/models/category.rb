class Category < ApplicationRecord
  has_many :products
  validates :name, length: { maximum: 255 }
end
