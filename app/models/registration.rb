class Registration < ApplicationRecord
    enum :status, %i[pending approved rejected]
    enum :status, %i[2_wheeler 3_wheeler 4_wheeler hcv]
    has_many :vehicle_images, dependent: :destroy

    validates :registration_no, :unique_id, :vehicle_type, presence: true
end
