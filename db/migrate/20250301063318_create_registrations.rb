class CreateRegistrations < ActiveRecord::Migration[8.0]
  def change
    create_table :registrations do |t|
      t.string :registration_no
      t.string :unique_id
      t.integer :status
      t.integer :vehicle_type

      t.timestamps
    end
  end
end
