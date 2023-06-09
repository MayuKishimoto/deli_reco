class Client < ApplicationRecord
  has_many :client_in_charges, dependent: :destroy
  has_many :users, through: :client_in_charges, source: :user
  has_many :products

  validates :name, presence: true, length: { maximum: 255 }
end
