module ParkingSpaces
  class Car < Location
    belongs_to :vehicle, class: ::Car
  end
end