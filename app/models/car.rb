class Car < Vehicle
  has_one :space, class: ParkingSpaces::Car, foreign_key: "vehicle_id"
end