class Negotiation < ApplicationRecord
  belongs_to :user
  belongs_to :product

  has_one :result, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :selling_price, presence: true
  validates :wholesale_price, presence: true
  validates :explanation, presence: true, length: { maximum: 5000 }

  mount_uploader :product_image, ImageUploader
end
