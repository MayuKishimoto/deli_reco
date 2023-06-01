class Client < ApplicationRecord
  has_many :client_in_charges, dependent: :destroy
  has_many :products
end
