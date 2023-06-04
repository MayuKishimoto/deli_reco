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
  
  before_validation { email.downcase! }
  validates :name, presence: true, length: { maximum: 255 }
  validates :number, presence: true, length: { maximum: 10 }
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
