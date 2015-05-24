class Vehicle < ActiveRecord::Base
  validates :licence_plate, uniqueness: true

  def self.search_by_licence_plate licence_plate
    where("licence_plate LIKE :number", number: "%#{licence_plate}%")
  end
end