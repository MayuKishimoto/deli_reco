class Negotiation < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :results, dependent: :destroy
  validates :name, length: { maximum: 255 }
  validates :explanation, length: { maximum: 5000 }
end
