class Negotiation < ApplicationRecord
  belongs_to :user
  belongs_to :product

  has_one :result, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :selling_price, presence: true
  validates :wholesale_price, presence: true
  validates :explanation, presence: true, length: { maximum: 5000 }

  mount_uploader :product_image, ImageUploader

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "explanation", "id", "name", "negotiate_at", "product_id", "product_image", "selling_price", "updated_at", "user_id", "wholesale_price"]
  end
end
