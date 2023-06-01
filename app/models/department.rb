class Department < ApplicationRecord
  has_many :affiliations, dependent: :destroy
  has_many :affiliation_users, through: :affiliations, source: :user
end
