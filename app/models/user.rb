class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :affiliations, dependent: :destroy
  has_many :departments, through: :affiliations, source: :department
  has_many :client_in_charges, dependent: :destroy
  has_many :product_in_charges, dependent: :destroy
  has_many :products
  has_many :negotiations
  has_many :results
  
  before_validation { email.downcase! }
  validates :name, presence: true, length: { maximum: 255 }
  validates :number, presence: true, length: { maximum: 10 }
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  
  def sales?
    self.departments.map(&:name).include?("営業") 
  end

  def developer?
    self.departments.map(&:name).include?("開発")
  end

  def self.ransackable_attributes(auth_object = nil)
    ["admin", "created_at", "current_sign_in_at", "current_sign_in_ip", "email", "encrypted_password", "id", "last_sign_in_at", "last_sign_in_ip", "name", "number", "remember_created_at", "reset_password_sent_at", "reset_password_token", "sign_in_count", "updated_at"]
  end
end
