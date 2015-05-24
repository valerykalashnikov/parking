class Moto < Vehicle
  has_one :space, class: ParkingSpaces::Moto, foreign_key: "vehicle_id"
end