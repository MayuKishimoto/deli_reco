class Result < ApplicationRecord
  belongs_to :user
  belongs_to :negotiation
  validates :content, length: { maximum: 5000 }
end
