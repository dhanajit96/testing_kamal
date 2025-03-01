class CreateVehicleImages < ActiveRecord::Migration[8.0]
  def change
    create_table :vehicle_images do |t|
      t.references :registration, null: false, foreign_key: true
      t.string :image
      t.string :image_name

      t.timestamps
    end
  end
end
