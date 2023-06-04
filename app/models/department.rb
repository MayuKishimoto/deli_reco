class Department < ApplicationRecord
  has_many :affiliations, dependent: :destroy
  has_many :affiliation_users, through: :affiliations, source: :user

  validates :name, presence: true, length: { maximum: 255 }
end
