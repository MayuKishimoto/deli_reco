class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :affiliations, dependent: :destroy
  has_many :client_in_charges, dependent: :destroy
  has_many :product_in_charges, dependent: :destroy
  has_many :negotiations
  has_many :results
end
