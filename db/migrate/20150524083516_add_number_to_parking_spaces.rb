class AddNumberToParkingSpaces < ActiveRecord::Migration
  def change
    add_column :parking_spaces, :number, :string
    add_index :parking_spaces, :number, unique: true
  end

end
