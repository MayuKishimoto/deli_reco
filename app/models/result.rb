class Result < ApplicationRecord
  belongs_to :user
  belongs_to :negotiation

  validates :content, presence: true, length: { maximum: 5000 }

  mount_uploader :reference_image, ImageUploader
end
