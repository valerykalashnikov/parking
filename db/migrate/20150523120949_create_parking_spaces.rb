class CreateParkingSpaces < ActiveRecord::Migration
  def change
    create_table :parking_spaces do |t|
      t.references :level, index: true
      t.integer :vehicle_id, index: true
      t.string :type
    end
  end
end
