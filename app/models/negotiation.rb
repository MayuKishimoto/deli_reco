class Negotiation < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :results, dependent: :destroy
end
