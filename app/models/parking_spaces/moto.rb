module ParkingSpaces
  class Moto < Location
    belongs_to :vehicle, class: ::Moto
  end
end