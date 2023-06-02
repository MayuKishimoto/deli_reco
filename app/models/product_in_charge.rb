class ProductInCharge < ApplicationRecord
  belongs_to :user
  belongs_to :product
  mount_uploader :reference_image, ImageUploader
end
