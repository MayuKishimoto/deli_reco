class Client < ApplicationRecord
  has_many :client_in_charges, dependent: :destroy
  has_many :client_in_charge_users, through: :client_in_charges, source: :user
  has_many :products
end
