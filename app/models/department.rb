class Department < ApplicationRecord
  has_many :affiliations, dependent: :destroy
  has_many :affiliation_users, through: :affiliations, source: :user
  validates :name, length: { maximum: 255 }
end
