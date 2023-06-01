class Department < ApplicationRecord
  has_many :affiliations, dependent: :destroy
end
