class VehicleImage < ApplicationRecord
  belongs_to :registration
  has_one_attached :image

  validates :image, presence: true
  validates :image_name, presence: true
end
