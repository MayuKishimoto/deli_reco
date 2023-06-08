class Product < ApplicationRecord
  belongs_to :user
  belongs_to :client
  belongs_to :category

  has_many :product_in_charges, dependent: :destroy
  has_many :users, through: :product_in_charges, source: :user
  has_many :negotiations, dependent: :destroy

  validates :assumed_name, presence: true, length: { maximum: 255 }
  validates :assumed_selling_price, presence: true
  validates :assumed_wholesale_price, presence: true
  validates :period, presence: true
  validates :volume, presence: true
  validates :purpose, presence: true, length: { maximum: 5000 }
  validates :concept, presence: true, length: { maximum: 5000 }

  enum status: { 提案: 1, 確定: 2, 中止: 3 }
  enum application_status: { 申請: 1, 承認: 2, 差戻: 3 }

  mount_uploader :reference_image, ImageUploader

  def self.ransackable_attributes(auth_object = nil)[
    "application_status", "assumed_name", "assumed_selling_price",
    "assumed_wholesale_price", "category_id", "client_id", "concept",
    "created_at", "id", "period", "purpose", "reference_image",
    "remand_reason", "start_on", "status", "updated_at", "user_id", "volume"]
  end
  
  def self.ransackable_associations(auth_object = nil)
    ["category", "client", "negotiations", "product_in_charges", "user", "users"]
  end
end
