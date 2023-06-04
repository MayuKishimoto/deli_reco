class Negotiation < ApplicationRecord
  belongs_to :user
  belongs_to :product

  has_many :results, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :selling_price, presence: true
  validates :wholesale_price, presence: true
  validates :explanation, presence: true, length: { maximum: 5000 }
end
