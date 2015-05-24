class CreateVehicle < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :licence_plate
      t.string :type
    end
    add_index :vehicles, :licence_plate, unique: true
  end
end
